Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8E375E84
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:41:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vyd96qtxzDqF0
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:41:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UnoaOFXE"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="G+GftQAb"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vybm73jTzDqPn
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C2B8C22314;
 Fri, 26 Jul 2019 01:40:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=VhghfA5tFplYA
 G4+r3v8vhMBGV0zbnubw2hoRcBBm/Y=; b=UnoaOFXEOcH0mIeQ6xiDJRTx4iXQg
 FaZiasNi23dvnEE9840RIcFwehZ7Bwht4bXwspKig4dgjPgYBI5UcS1CLXIt9yko
 b3jebsEzrycjFRbk5j6xmIFl4GOWO+NyydaLcfRpTCyXEUuaSdnH8qSdTMGBAs/L
 YKg4NDRDBVMv4czzdNCrIcoMkvqa1wW3o6TDliQr0SIWggff2I1eUjq4A/ecdzvE
 d/4zEPdbjVw2x34flxlHFZ1uBxE89uhyJ9NiNnZYfMQMtEtWQisb3Ivi8RSPbw0K
 4XkBlmCfnI3SeZf079IYe7xjQcpoSFdtmkDS52oBimUDOy/Wuv8ybSL+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=VhghfA5tFplYAG4+r3v8vhMBGV0zbnubw2hoRcBBm/Y=; b=G+GftQAb
 /rKZ9MAl7JMDFFpOmCOqFFqZD0CGUR7iC1/XnBvWS4YNwg+TLAxRzJ4h5yooJK84
 U+lY/yCl3tVi15rPc0QjxsCY3qxJb6j7YF8jATMD7yiuvMKT0qlM+5//o+/nYQ2o
 lzmQKpik+2CsMOMTyfNXo+32a83yNXu4zjTZeSyPqF03u9VUKJeorL2CWdLdZ8uA
 ky/i1c4zZ7+qncKpgSRhT2rUmUWl49rDBGge4FsbIGYj9GPRXF3cmGtMVpfr1X7D
 ak6099cdK84kaBJepcfhly+L589qq6XSdB0P+4QDDtXrrjoNiDlhOsjIf0wK/XRK
 VMH76LGgM4SduQ==
X-ME-Sender: <xms:UpI6XXVF_1C1lteWYT6S3CTWIeoE9X8i3ziVLaLl5RSh5G9Tt0Z1Yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 ke
X-ME-Proxy: <xmx:UpI6Xa_PMnGd9Qab_zrULwXKFIsKv48MpcoUrUo0-8_XsgKdenlNiQ>
 <xmx:UpI6XcytPj3AIuERkV1HTGPs3NcjqAzEbwZtZzIpoaCFRQc6vsu5aQ>
 <xmx:UpI6XaGPUPeOmv2aJYvCY6rnEUfhD14HApn_HcS39f3fC4koiTYy2w>
 <xmx:UpI6XaANAR6MkRct3Wl-0IE2DCIFr5FTTggCZvpMiDDRTJ91KyQN2g>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2FF26380075;
 Fri, 26 Jul 2019 01:40:30 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 09/17] ARM: dts: ibm-power9-dual: Add a unit address for OCC
 nodes
Date: Fri, 26 Jul 2019 15:09:51 +0930
Message-Id: <20190726053959.2003-10-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
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
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

These temporarily have a unit address until userspace is fixed up as
noted in comments elsewhere in the dtsi.

Fixes the following warning:

    arch/arm/boot/dts/ibm-power9-dual.dtsi:89.18-91.6: Warning (unit_address_vs_reg): /gpio-fsi/cfam@0,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
    arch/arm/boot/dts/ibm-power9-dual.dtsi:190.18-192.6: Warning (unit_address_vs_reg): /gpio-fsi/cfam@0,0/hub@3400/cfam@1,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/ibm-power9-dual.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ibm-power9-dual.dtsi b/arch/arm/boot/dts/ibm-power9-dual.dtsi
index 2abc42eda7b0..a0fa65b44b0f 100644
--- a/arch/arm/boot/dts/ibm-power9-dual.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-dual.dtsi
@@ -86,7 +86,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			fsi_occ0: occ {
+			fsi_occ0: occ@1 {
 				compatible = "ibm,p9-occ";
 			};
 		};
@@ -187,7 +187,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			fsi_occ1: occ {
+			fsi_occ1: occ@2 {
 				compatible = "ibm,p9-occ";
 			};
 		};
-- 
2.20.1

