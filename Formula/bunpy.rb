class Bunpy < Formula
  desc "One binary for Python: runtime, packages, bundler, tests"
  homepage "https://github.com/tamnd/bunpy"
  version "0.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-arm64.tar.gz"
      sha256 "1289f66fcc5716357a9e824f6addfca0d46c4b5750378444f8237894d88821aa"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-amd64.tar.gz"
      sha256 "19884b9503db92bfe12e592c593dcf62ad756ee0a81594778235d2905c9f879a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-arm64.tar.gz"
      sha256 "6780df16b369798cf2fd4939e5852b91740e6bd91c0c2b8541c8629f66261c04"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-amd64.tar.gz"
      sha256 "4bb10df426c6aef3c9c21359a3c79aa124ba368345422d5302f3a539745ff9d3"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "bunpy-v#{version}-#{os}-#{arch}/bunpy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bunpy version --short").strip
  end
end
