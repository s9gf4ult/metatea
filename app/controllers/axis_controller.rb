class AxisController < ApplicationController
  require 'rgl/base'
  require 'rgl/adjacency'
  require 'rgl/connected_components'
  require 'gsl'

  # GET
  SETTINGS[:axis][:names].each do |axis_name|
    define_method axis_name do
      @axis_name = axis_name
      pre_graph = {}
      TeaComparsion.where(:axis_name => @axis_name).each do |comparsion|
        keys = [comparsion.left_tea_id, comparsion.right_tea_id]
        if pre_graph.has_key?(keys)
          (a, b) = comps[keys]
          comps[keys] = [a + comparsion.result, b + 1]
        elsif pre_graph.has_key?(keys.reverse)
          keys = keys.reverse
          (a, b) = comps[keys]
          comps[keys] = [a - comparsion.result, b + 1]
        else
          pre_graph[keys] = [comparsion.result, 1]
        end
      end

      graph = {}
      pre_graph.each do |(f, s), (res, count)|
        if res < 0
          graph[[s, f]] = -res / count
        else
          graph[[f, s]] = res / count
        end
      end

      ug = RGL::AdjacencyGraph.new
      graph.keys.each do |(l, r)|
        ug.add_edge(l, r)
      end

      (m1, m2) = build_maps graph
      tea_groups = []           # [[[id, xpos]]]
      ug.each_connected_component do |component|
        rest = component[1..component.length-1]
        (mtx, v) = build_lineq m1, m2, rest
        resv = GSL::Linalg::QR.solve(mtx, v).to_a.unshift(0) # prepend 0 to its place
        res = normalize_array resv
        tea_groups.push component.zip(res)
      end

      @comps = build_maps(graph).to_s

      render :show
    end
  end

  protected
  def build_maps(graph)
    m1 = {}                     # id => [[id, id, weight]]
    m2 = {}
    graph.each do |(f, s), res|
      if m1.has_key? f
        m1[f].push [f,s,res]
      else
        m1[f] = [[f,s,res]]
      end

      if m2.has_key? s
        m2[s].push [f,s,res]
      else
        m2[s] = [[f,s,res]]
      end
    end

    return [m1, m2]
  end

  def build_lineq(map1, map2, vertixes)
    size = vertixes.length
    m = GSL::Matrix.alloc(size, size)
    v = GSL::Vector.alloc(size).col
    vertixes.zip(0..size) do |vertex, rown|
      #  FIXME:
    end
    return [m, v]
  end

  def normalize_array(vector)
    return vector               #  FIXME:
  end


end
