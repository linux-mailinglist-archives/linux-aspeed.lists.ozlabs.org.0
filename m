Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B784CF872
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 13:34:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nZyD4Y6bzDqP0
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 22:34:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OXOEf1pI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NFbew7aN"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nZxw532QzDqD3
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 22:34:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6DA6C20C8D;
 Tue,  8 Oct 2019 07:34:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 08 Oct 2019 07:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=POMHwN73ao1VX1XVvng87eUIHu
 egEN2mJo0ATUF+SyY=; b=OXOEf1pIx5XZ0ox5FfAl5t+OYKHLONEym8sqHCQxJ6
 Vo0oe30Ejx09yZwPsas7W9SqOb8oliFwwoVbWhq+pYt439X3uY3uJwvpbLGfUSxb
 ta0z4DcQbl6FqenkmpLZ1cskDxIrpxosWLAo2u6R7FNLVdm0a5Ow2evcdK7WRifu
 SjA1UOXuSm646fZ4jicKeILwaH7fwrD4005YWfhRNRUqFN8ayXObB6dKe4DFTeDF
 9pxp/AsnBTQf6WUJmNOvWHfrl/lkbWApPd0l3GZXv/1GkCVwegOuckvhMzz2Ap1c
 6krOWgtGtX4vSVOYJRImd9RtOwB/4XPvI50bivyEyNgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=POMHwN73ao1VX1XVv
 ng87eUIHuegEN2mJo0ATUF+SyY=; b=NFbew7aNCP9NXA76QE4YKLrHIat/7qMna
 3Bl7XmoCuC8RuOugY2EfJ8q1JKXOJuajWtRoZX8Cy9Dl3GnmOoSi0CMwYi2FuH7i
 pIYMGRn/jcsqS92XFaUqnZ669+hmutHQVUyYRBledc3XvyXd//Est6mIfDdtMsO1
 ECTBampCoEQ+vGo7D8+kdFlqTSu2xAKBnajrPzf+702AlIsQr759IKWg+KvRWWRZ
 P7vLiyTXUbGO2KI7nQ5BRvE3ljX/yc6gN5qIgd8xMPDDDsO0Ww2CpQrfhIETYZik
 VqF5vQHbwv9bajYuMjIiJb12AuvKs3n/Zzs/v0qiCccGSIHr5g4Mg==
X-ME-Sender: <xms:P3ScXTKx9szxQfYf8k00yQS_d5JWZFBaRQufZzxcl9uxnsRDvZn_KQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:P3ScXZ-iU2Yieq3etzQ-OntBIonjhalisjdnWTwiadUFjNYIU58fCA>
 <xmx:P3ScXXLxOxTvyDiPHqHN2GT1pYlxbFRzWS7D1iocQ3kd4RTvDz5BGQ>
 <xmx:P3ScXX_g8RG_akPyo9xQLnqLi30tDmpkf6eBwEfw0DR1NQySwhWRAg>
 <xmx:QHScXbSDaCra_m8nRs_5Ton2b0jljcgYvhxmGAsJzSorXwzt-vAmvA>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 811BBD6005D;
 Tue,  8 Oct 2019 07:34:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: aspeed: Expose RMII RCLK gate for MACs 1-2 on AST2500
Date: Tue,  8 Oct 2019 22:05:21 +1030
Message-Id: <20191008113523.13601-1-andrew@aj.id.au>
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

This series is two small changes enable kernel support for controlling the RMII
RCLK gate on AST2500-based systems. Previously the kernel has assumed u-boot
has ungated RCLK for networking to function.

RMII is commonly used for NCSI, which itself is commonly used for BMC-based
designs to reduce cabling requirements for the platform.

Please review!

Andrew

Andrew Jeffery (2):
  dt-bindings: clock: Add AST2500 RMII RCLK definitions
  clk: aspeed: Add RMII RCLK gates for both AST2500 MACs

 drivers/clk/clk-aspeed.c                 | 27 +++++++++++++++++++++++-
 include/dt-bindings/clock/aspeed-clock.h |  2 ++
 2 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.20.1

