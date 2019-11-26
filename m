Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDD1097CD
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 03:23:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MSPV6BWMzDqgZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 13:23:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gC+KpiU1"; 
 dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MSP72TRszDqdt
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Nov 2019 13:23:07 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id bb19so3970635pjb.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Nov 2019 18:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xbKjbaa4u/VuF0dita2DzSgc+Ewhehs6e1Su0L/FDtc=;
 b=gC+KpiU1/r8M8/r/NGN7p7vTKHt1QMoHl5c/3oKsVU7/ZjLFPvqCTLc8lpGIukdyq+
 2zupypCniRRMo/6R1pEA+w74J82zDhosQu9RM/iVe3c8Kv2rtDhkippUWefGz+jo68oJ
 PBRvUd4FwgCslY+74JAWBGn7DeoBllXzTuUeJqVuGEcQVk+F87nyuod4I6Vo4FbRsWOd
 97F9GQUFKqkDBfibOXESayOvwGuPYZW7UuznwEj7Wdp2UmLsC6oE8Cd87+5rmjnjeJlc
 r6fpJGHsIf0yFNhbZQdV8bJXg+Ue3/6+bUSKwG7VZ9QdWcNWB9NrKqPeCxWM1eA2CO9l
 mzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xbKjbaa4u/VuF0dita2DzSgc+Ewhehs6e1Su0L/FDtc=;
 b=sO7zKJED/yF0RxBQ8edxFvcTMHaFOygXZkJBO3WWR8uqiBqJe3L6wFVPkeJwXQkGnu
 UrMvP341jLJ+UCnsKwM7W0xYxvlxZQn0HqdSYd76fkTHfKqmX3Hgp0PXjsbkekoUBRBl
 y6/9hFnQJKiPnKpnKJNRcI1eCYFGmd4DuNy4f/fYOBugRmbEFX4TE1a5frkN5ZWTclkL
 WJQCmQ2sfKRceKIPSssK2Lah/oWTcgf8Tr5akreJ5vnXY117uH0VowkKWf/g3IKNfdJs
 AzKeQ2NE3P7ChyZoWTc7p/zEzRl5KvP6PE7wZegFpGCGUUPo4k4TNtPbxR8Ad4dh/j3c
 xJFQ==
X-Gm-Message-State: APjAAAU7G9Kqhmo8mXoL9YF4CIAXew+lBxGokPSKSJxtMup0b5VRPnHY
 +iPwnbODUEXvyhX+5FWf3Kw=
X-Google-Smtp-Source: APXvYqzVEbC7IHgNm9PgTKAbD8ogbBca66OHQGbpa3PaHWkRQPie0o8we6vwzQtmBRp1ClM1NFv+2g==
X-Received: by 2002:a17:902:1:: with SMTP id 1mr31237195pla.338.1574734984197; 
 Mon, 25 Nov 2019 18:23:04 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q70sm666568pjq.26.2019.11.25.18.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 18:23:03 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/2] dt-bindings: mfd: Add ast2600 to ASPEED LPC
Date: Tue, 26 Nov 2019 12:52:42 +1030
Message-Id: <20191126022243.215261-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126022243.215261-1-joel@jms.id.au>
References: <20191126022243.215261-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 has the same LPC layout as previous generation SoCs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index 86446074e206..bef07c3b1a3e 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -46,6 +46,7 @@ Required properties
 - compatible:	One of:
 		"aspeed,ast2400-lpc", "simple-mfd"
 		"aspeed,ast2500-lpc", "simple-mfd"
+		"aspeed,ast2600-lpc", "simple-mfd"
 
 - reg:		contains the physical address and length values of the Aspeed
                 LPC memory region.
@@ -64,6 +65,7 @@ BMC Node
 - compatible:	One of:
 		"aspeed,ast2400-lpc-bmc"
 		"aspeed,ast2500-lpc-bmc"
+		"aspeed,ast2600-lpc-bmc"
 
 - reg:		contains the physical address and length values of the
                 H8S/2168-compatible LPC controller memory region
@@ -128,6 +130,7 @@ Required properties:
 - compatible:	One of:
 		"aspeed,ast2400-lpc-ctrl";
 		"aspeed,ast2500-lpc-ctrl";
+		"aspeed,ast2600-lpc-ctrl";
 
 - reg:		contains offset/length values of the host interface controller
 		memory regions
@@ -168,6 +171,7 @@ Required properties:
 - compatible:	One of:
 		"aspeed,ast2400-lhc";
 		"aspeed,ast2500-lhc";
+		"aspeed,ast2600-lhc";
 
 - reg:		contains offset/length values of the LHC memory regions. In the
 		AST2400 and AST2500 there are two regions.
@@ -187,8 +191,11 @@ state of the LPC bus. Some systems may chose to modify this configuration.
 
 Required properties:
 
- - compatible:		"aspeed,ast2500-lpc-reset" or
-			"aspeed,ast2400-lpc-reset"
+ - compatible:		One of:
+			"aspeed,ast2400-lhc";
+			"aspeed,ast2500-lhc";
+			"aspeed,ast2600-lhc";
+
  - reg:			offset and length of the IP in the LHC memory region
  - #reset-controller	indicates the number of reset cells expected
 
-- 
2.24.0

