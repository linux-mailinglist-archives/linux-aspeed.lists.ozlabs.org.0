Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C224C2644C4
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 12:55:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnG4h6MpmzDqc2
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 20:55:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=arHubH2L; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JmXCTbHa; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnG4K3t8DzDqBM
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 20:54:57 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A21E5C10C4;
 Thu, 10 Sep 2020 06:54:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 10 Sep 2020 06:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=f4VdJeRI0UCiq
 PdXh4f/FQzWUUOhHo9nR21AJ+6YsDk=; b=arHubH2L2KBiTXNVUo3PegTxuNBPJ
 Tl8pr+vwFnoOGAelQoIr6qsaOeVYjvh/XYanZ2fmHx8c2AFPKYUv6dssDyv2VkIY
 8jC0sDOmw1CI6G1Gza/0SHAPXx/9SpnGzv5g4NMiXzOk4Anm9ZbfJYnpfz+Eyr76
 202p5s93JvZzdTwLoLfYVFHKVRVVYEukGa8Tz8oP9nf/IwBl31T6Xl3APVvT2ov0
 UDKYIcbQHm6mHQPPq/KAutPMoCRWKJUkJhDgKpnlwp7ZQ8TOTSrt9jJeNFsI2Qu8
 0ZVxXPNSMHXI5hjHmH+neGzXQUiksk4sByBrr7e0ECNWSCLz0ljBgcYAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=f4VdJeRI0UCiqPdXh4f/FQzWUUOhHo9nR21AJ+6YsDk=; b=JmXCTbHa
 /9ICQ2jVjnKTg32/593Nhf8i5blW8TfQED872BKJsP/c/Bkm9gWi3iqDhrGhP4Y7
 MlgIrtv2gyOURGnWIMF8pS3qAO4jrttEb3L8OQnJk0MEw0E8celcKXZ+MfmhcIkg
 yanrYxLJ+GBQkacA4g2zWZneGzGCYAK3gZjVsrNSrTd/T6R+b1qPfGRRrW/hV/q7
 Z9Ogc5HkgcbxqKEZRTHpReH5aaMNQ+ziui+ofjns0M2cRj3mGVcOumakxYV/7jiu
 tCmkWohFVI481das5+jPqY3hBlTnOill0JqvA9Joey6scU6GiT0Nj/x2I0lraiyh
 ZTHG3nJEE8q3tg==
X-ME-Sender: <xms:_wVaX_nhURj3B039mYx8yBIpa8F9YFZWG7lCX8ryyZPHjXaOSYLc7g>
 <xme:_wVaXy0JZXO32dTM3dYCcqpHShc7pW4e2Lannt_ISHj5BZQxmxQRwK9meifDyRzAa
 -t5FOuV7sdGrU3pRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:_wVaX1quH1uHYXmfOnqH6Wn20atjblTxpkcD0Isd-XWHQjoOyW6vFw>
 <xmx:_wVaX3mE_U59DBN1ERKtNqlFnarqyUQzqhmgZvtjRaddbOzjMQOXWg>
 <xmx:_wVaX93hxbAoucu4X1g7I_1KHj6t-uxwAzrfxUwWent3gngA6-Cpmw>
 <xmx:_wVaX3q3z0DdStk-bAu9c_fLifSoUmf0EnFP2yl1Qh_K07bXltBy_Q>
Received: from localhost.localdomain
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 35C81306467D;
 Thu, 10 Sep 2020 06:54:51 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH 1/3] dt: bindings: mmc: Add phase control properties for the
 Aspeed SDHCI
Date: Thu, 10 Sep 2020 20:24:38 +0930
Message-Id: <20200910105440.3087723-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910105440.3087723-1-andrew@aj.id.au>
References: <20200910105440.3087723-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add properties to control the phase delay for input and output data
sampling.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
index 987b287f3bff..75effd411554 100644
--- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
@@ -61,6 +61,14 @@ patternProperties:
       sdhci,auto-cmd12:
         type: boolean
         description: Specifies that controller should use auto CMD12
+      "aspeed,input-phase":
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description:
+          The input clock phase delay value.
+      "aspeed,output-phase":
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description:
+          The output clock phase delay value.
     required:
       - compatible
       - reg
-- 
2.25.1

