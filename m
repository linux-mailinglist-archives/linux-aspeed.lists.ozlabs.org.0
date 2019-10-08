Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF47CF885
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 13:35:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nZzF1bLKzDqPK
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 22:35:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kh5/7FOW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gDOgYUGx"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nZyW4YzRzDqNy
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 22:34:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 31A6C21947;
 Tue,  8 Oct 2019 07:34:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 08 Oct 2019 07:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Pm0kXIjD5EnSX
 CMvxmhv05EI+M+VF9thTQPnyey0/W0=; b=kh5/7FOWrDpCzViUg2B1WNJJqQrsu
 BkNWaozam2jqUUV5ch+W0Ngo9WjwhTKMyA37cDd9tyCCnB2mtcGJ2YiqzcOvGa4e
 5V8ABOROBBg7fdIfpoc/RSllptIq676BF0VLVBheWhzYNqQSLAXwZwm5E5ngQlr6
 BvdgJDuCou1+dKGIN3odO0Jek2pudDJ901ytJKR1VUOM/ZKdbZy8vNZudT1g4y3D
 QW1XWiO4uwc9Qz5W9Adgbd3N29Q7syEoU/CPgcL1cemjlnksKDPvDStDzzKzcHYj
 4LopTVFRu/ij9ICifeSWrQGZ4kglwdxAhNDkPs3nEWyHKgcibiSis6N5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Pm0kXIjD5EnSXCMvxmhv05EI+M+VF9thTQPnyey0/W0=; b=gDOgYUGx
 RRCEI3hJq9Gt5RFL4dM1qPIbEI0+aBroI9FRiNohFEfvfQ8g4blLC3yGSedvm6K3
 kXTj56AijNn/lNqwzvitzsstaC7rSEmoF1sXfmqS0YGjKFROkOOYO2qcHuMyZXOg
 cw0aSwEbo1pgMs4I1YnJKMvx86ZjtPhgoRn2H+ytrvjgqsRlm1AMaRBtl6wOJ/6F
 KouOmbbO+nnw/32Wc3bG53J1BLSAI/rhvLcFeX1ptutXa5OabmPlVVNKOV8hVWJW
 bQTQNAW0UmNAPlmpOaOpN3O0qzHbo66xJm1Xj1/9g0/0xw/lrPgx+0nPBIEq+M5Q
 J2Pjrdjwoh9oFg==
X-ME-Sender: <xms:YXScXfaaubACZ_PkWPHJaFdVbgaCo5OXo48mIQyxAsjV5KPIo9lRLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepvd
X-ME-Proxy: <xmx:YXScXYA26vS1yEvEyZLjdAvy9xC2QhSDkMM2dN21lx2n4PV4vMAZKA>
 <xmx:YXScXeoHdIJe49tkm4st59yiNy_kV37pDrGOEC_vbOvZ9F3mUnYaQw>
 <xmx:YXScXXJabEV6sdJWLV1e3XtE2kKvoAFO8X6H7YGRVN3C6DOzXl2ptA>
 <xmx:YXScXUBHPusRgdMqxXzOS-cyIsfCQUGC6SA18U2bTirZBFmIxTt_Tg>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 489E680062;
 Tue,  8 Oct 2019 07:34:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-clk@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
Date: Tue,  8 Oct 2019 22:05:52 +1030
Message-Id: <20191008113553.13662-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008113553.13662-1-andrew@aj.id.au>
References: <20191008113553.13662-1-andrew@aj.id.au>
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

The AST2600 has an explicit gate for the RMII RCLK for each of the four
MACs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 include/dt-bindings/clock/ast2600-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 38074a5f7296..ac567fc84a87 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -84,6 +84,11 @@
 #define ASPEED_CLK_MAC34		65
 #define ASPEED_CLK_USBPHY_40M		66
 
+#define ASPEED_CLK_GATE_MAC1RCLK	67
+#define ASPEED_CLK_GATE_MAC2RCLK	68
+#define ASPEED_CLK_GATE_MAC3RCLK	69
+#define ASPEED_CLK_GATE_MAC4RCLK	70
+
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
 #define ASPEED_RESET_JTAG_MASTER2	54
-- 
2.20.1

