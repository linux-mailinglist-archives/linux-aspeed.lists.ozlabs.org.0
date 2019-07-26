Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 475BC75E85
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:41:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vydG5PzpzDqQ1
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:41:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="a+CsVaRl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YpAITDH0"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vybr6MrjzDqPS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B0D422131;
 Fri, 26 Jul 2019 01:40:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=when0qkXTHByR
 DowfQK5HCqanY/vJnQ/jMJsPByOs70=; b=a+CsVaRljZpVprqFBSgnzv1R850JX
 PCONSeS5+Ns5kCX0vf9uiRklR7xqNHVA8dCG5aWQ1wfFQ7M+V86wIKOaIT22hEXW
 P0ARVGiZR6OpJ7Rm9o+snxwiR307GmPLwOOSm8jcrRTXmIDOUwzUwwys83rP374M
 XKw1WxYNTj/dD87o2UKjyzcn+XTZp1pgV5u5kbA1slt+/z9j5htO9pLinfkdNE8N
 qH4F/8NtIVod//rxJCPYPjEZpdaARnqnz+Ucpkd4a6oi08IcmN/a7ML5kZ+tO16K
 oDz2XYJPx+VWcbNytfBQJQ1Oh/Vum4DHwaPDET1PXFZB6d7jVztfj6MXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=when0qkXTHByRDowfQK5HCqanY/vJnQ/jMJsPByOs70=; b=YpAITDH0
 YCCMpCLlYpIqhTuGOmwJDSUyHp8A8PfR6q3vnmHz6svTlYDvd93NitxgP43l9uUr
 gdDFE5S+qMhu6z68iHBNxSrNZmhZc46dlLY5HEP/MHkdYG6SzgCqm37NJ2+Kuy/p
 LtNT/VOPnMgNHUEcAy6lkEndVQlIeZe6GrvkLdnr6OHA2EqYXe3vGLc3LsmlqHuZ
 Y2mRkTl4J4KQZj1ISi9j5YcQeqVFD3a1MlCvP6BiNvbwczh79TVRugtRlEJSdu1w
 0eJ184nSGWeDU9lAJ6nBWHDibaG7Oq3Amqm3XTMS2aP4a7doD0JN+Bq/v0b5iGt6
 agct9Yw1VBaHYw==
X-ME-Sender: <xms:VpI6XSUyElCjY3qdtf00HZIAG_hSVIbO-u6z1VBshCUOWuiObz5I0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpeek
X-ME-Proxy: <xmx:VpI6XRJ4nPPL2gcdzB_nCByc1LTGBGOSJM3V6qBS4jfu3A_jPyhxxA>
 <xmx:VpI6XaAgNSFu9RngqpfdeMiKVW3-nLr0WUbbwuCaAvsR3K4w1vNQCw>
 <xmx:VpI6XZdZ-7-7Z8qAWQuK862fS9g8Ju22NEgkupI227yUg7mfPCbxsw>
 <xmx:VpI6XZImWUphZneqP7nvCHXjY8voYYEn7t4v53TCl2GLxSHVBh49hg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 02E35380074;
 Fri, 26 Jul 2019 01:40:34 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 10/17] dt-bindings: pinctrl: aspeed: Add reg property as a
 hint
Date: Fri, 26 Jul 2019 15:09:52 +0930
Message-Id: <20190726053959.2003-11-andrew@aj.id.au>
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
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The pinctrl node sits under a syscon device, and can assume offsets from
the base of the syscon based on the compatible. However, for devicetree
correctness allow a reg property to be specified, which an associated
driver may choose to use to discover associated resources.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml    | 3 +++
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml    | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 125599a2dc5e..629a55c167ae 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -25,6 +25,9 @@ properties:
     enum:
       - aspeed,ast2400-pinctrl
       - aspeed,g4-pinctrl
+  reg:
+    description: |
+      A hint for the memory regions associated with the pin-controller
 
 patternProperties:
   '^.*$':
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index 3e6d85318577..2e8971e23a02 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -25,6 +25,9 @@ properties:
     enum:
       - aspeed,ast2500-pinctrl
       - aspeed,g5-pinctrl
+  reg:
+    description: |
+      A hint for the memory regions associated with the pin-controller
   aspeed,external-nodes:
     minItems: 2
     maxItems: 2
-- 
2.20.1

