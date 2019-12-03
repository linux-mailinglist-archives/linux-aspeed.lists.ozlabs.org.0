Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461310FD37
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 13:06:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S11S5WCCzDqLy
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 23:06:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZhrnwV6u"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sl0EBSwP"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S0wp5n6MzDqVk
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 23:02:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4163E22387;
 Tue,  3 Dec 2019 07:02:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Dec 2019 07:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=HvGKvLGsejv5q
 6GtTUOtGOukBgIcidGBW9MonuS68ho=; b=ZhrnwV6uViMAZA7DE3VsRIv2y8sXN
 5hjKHMWJ5RYy9gvC9/tDa/mbWucW2WyxnS8FwW1AWnkdNLaDGfxda3KuB3/81y4j
 cW8JaWy0IOTZaho+6PeoguX7l0sgJbWlHwrEENGPUqTs15nzNG976FKax/nQXDBN
 VAgTCntkVjKE49ShbL/PZOuhzJ1EcpAFARviacyck2vqg4KHgnjYFTVTeHi3n+B9
 iPDYjLBMJRhIgH1Mx98lb2L0hADXmBQcimcoprWRN1SkT3BPAnzI5FaAJMoMPQ/B
 MXacJHmGEZuiIsNp2GA/1m+QVpVnJ/tb0BxCaJyjxEgFvexJ9TxI5LqFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HvGKvLGsejv5q6GtTUOtGOukBgIcidGBW9MonuS68ho=; b=sl0EBSwP
 fgLfdNvtYWMq/0qrx0ZGOv27mt4dcztUaChUrZSERre07/ihve3kCbQCOjm3Voqk
 MRlo1nOvuXOveWhBPRLP03b86a8F+hNZjuL72+V7zau/vOzmvCfJGx8ShAD5lfUA
 f4zujIHv0dBHSZnocs88gc5oRZQ/rzDVwN3WkKUX7+8pocg9S4vfs3Mc0ievGkHL
 mEk071WC5LjbtQWZkI544+n+zDbtS+2t86TkFgLVZXZgRNbxuukVGtaScoiy3EHb
 rw83Ewf+/9xPZBonrbAhRnM5ipX3MKBRVx7bDjibtpVLn63sj+f3phhz/Qd8stkB
 KQZJ0JxpCFCTOQ==
X-ME-Sender: <xms:507mXXpS44J2E45MefSpX8tSikwu0lYlyK0wFrrO7Br3OmtqoYhWYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepudduke
 drvdduuddrledvrddufeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:507mXRn7vMqPqPrN5DsJ7J780TPxURG48xFaDKotRxQJuBiqvk4kOg>
 <xmx:507mXfx9HFVOZVZ9rm2-i11nHBTD0drKeWLmkbEXfm3j-L84tyWUAg>
 <xmx:507mXf1gat-BVlWeMrbE2wx9uiqEqMZWk4cNFfU4RAGKjQGkbI1I-Q>
 <xmx:507mXWbxXFwHAE-iFS9J3-ByRyCdtVYORzJCkbx3s-aS0YvpX-dEYA>
Received: from mistburn.lan (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id C0480306010D;
 Tue,  3 Dec 2019 07:02:43 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 01/14] dt-bindings: pinctrl: aspeed: Add reg property as a hint
Date: Tue,  3 Dec 2019 22:34:02 +1030
Message-Id: <b65a012a91b49352c0cdef01e8959a62537c8d76.1575369656.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
References: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml | 3 +++
 Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 39ad8657d018..bb690e20c368 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -22,6 +22,9 @@ description: |+
 properties:
   compatible:
     const: aspeed,ast2400-pinctrl
+  reg:
+    description: |
+      A hint for the memory regions associated with the pin-controller
 
 patternProperties:
   '^.*$':
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index 3c6405be07ed..f7f5d57f2c9a 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -23,6 +23,9 @@ description: |+
 properties:
   compatible:
     const: aspeed,ast2500-pinctrl
+  reg:
+    description: |
+      A hint for the memory regions associated with the pin-controller
   aspeed,external-nodes:
     minItems: 2
     maxItems: 2
-- 
git-series 0.9.1
