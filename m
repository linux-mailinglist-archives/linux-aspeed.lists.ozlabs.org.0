Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 580BBCF882
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 13:35:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nZz35FffzDqNZ
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 22:35:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pk0eRjpS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZvJABR84"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nZyS1lmdzDqNn
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 22:34:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 05EE021F83;
 Tue,  8 Oct 2019 07:34:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 08 Oct 2019 07:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=y0VW5yf2PF1LsvzvqAZZ+ZX5t7
 7d0UMxShyI80xACEY=; b=pk0eRjpSJcTAE4PnWISz7ZTrGWuAhfaOHKg+1c5uA6
 IrnSuq6tVnSQCYEWH7yWghrixVmw0ikpv5SfZ5OjDYSJqBDnIHEzyXKQVZdUNotX
 pHCqoHkkVPHRlY5rj1nrty2XXg/jtdAQVpLg84xq51Jw54hgVCKXVjBmfQ6VMcaR
 gF8iHjjPyS7+Z3VutM2kMrJe3YuNVTLFuBlJKS8N0sCh5ZNOopXRzRK4NOQ2a0YU
 I0PaNcO6c+6SE5r1QsSC7I18BiuiTszuX9awXZ3bGKwILgMCLimisLAVNzOB25eo
 F0EfgQwO79h/Elz0minBie8/0dPPs0DznXTCWX88ZbOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=y0VW5yf2PF1Lsvzvq
 AZZ+ZX5t77d0UMxShyI80xACEY=; b=ZvJABR84cEocC8LySf65dRGt0US45XcI7
 QCp9LKXZyo0l+nwhk3+NIXTW+Qdj505q6CCG0QGtzx6Eu4QSvYVkt4uw2VY9/vV7
 PCTeCfrRgrGjjVTHCJ1mA1poW5lwl2Eq1cxuKLx+HTEs42GkSLxfeSigenO4XK7n
 UrjMXsxIibs8wAMP0DKZgTApqnoiscEOLrlswplu2KpsNV+ZS15UN0SX4SEzNrLy
 rlj+KgiMTCrxBjPwDeDLfKrJsUBaXiXAh/+shCipn/zPQ/eb9vlYE0ZMrC9Rjc2a
 0KpirxSRCuXLLM7LHCFexiLyd32U1z3ukLZ2nPiDPGTsaCmOI88tQ==
X-ME-Sender: <xms:XHScXXzxfopRfG5qkUUYdTiFEi24L0KOwnLdWmsVmfA05umw26KArQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 ud
X-ME-Proxy: <xmx:XHScXa7_07xHmFT7WajFMI2g4wyEiqhukM9d45PjD5akT5e1uTHMhQ>
 <xmx:XHScXTfICRbswpRiWjcLtNokaLKlqGxI3UVuD7c3KgVpHghi5xyWqw>
 <xmx:XHScXf75PyDM9hHCcadyWg20LhSRe9VnGjjckdT9B8fDBL9xXzBL6g>
 <xmx:XXScXQX7wb2zNkAHRIaZLunM8nRH24Oj0g5DrGUlig-G27jVZlwiCQ>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E63180065;
 Tue,  8 Oct 2019 07:34:48 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: ast2600: Expose RMII RCLK for MACs 1-4
Date: Tue,  8 Oct 2019 22:05:51 +1030
Message-Id: <20191008113553.13662-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series is similar to that for the AST2500 but I've split the patches out
as the AST2600 driver is new for 5.4 and I'm hoping we have a chance of
slipping them in. Maybe we can get both series in, but I thought decoupling
them might make it more manageable if not.

Regardless, the blurb:

This series is two small changes enable kernel support for controlling the RMII
RCLK gate on AST2600-based systems. RMII is commonly used for NCSI, which
itself is commonly used for BMC-based designs to reduce cabling requirements
for the platform. NCSI support for the AST2600 is not yet implemented in
u-boot and so unlike the AST2500 the kernel can't rely on RCLK already being
ungated.

Please review!

Andrew

Andrew Jeffery (2):
  dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
  clk: ast2600: Add RMII RCLK gates for all four MACs

 drivers/clk/clk-ast2600.c                 | 47 ++++++++++++++++++++++-
 include/dt-bindings/clock/ast2600-clock.h |  5 +++
 2 files changed, 51 insertions(+), 1 deletion(-)

-- 
2.20.1

