Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD6510D01E
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Nov 2019 01:09:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PFH069gyzDr99
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Nov 2019 11:09:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hFf8A3Xu"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PFGh08zpzDr8g
 for <linux-aspeed@lists.ozlabs.org>; Fri, 29 Nov 2019 11:08:43 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id o9so12164768plk.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Nov 2019 16:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dpxFtxxgBElM+YJglBfx04/eAo0nvXB7AnoxAb/3UH0=;
 b=hFf8A3Xuv+sXyGmJvDCRUD4X5Sxql7d54f08MeyyQc2L2AhMvtWP0mOin+7b8F8KiH
 7iykoIqbtUPxSYdOqptxx9NZZUvlvLbM5yeZqgKlekBCyN8Q9AkKk/FhlJZwdmHZH/ne
 SWx4DbiXDrugh7fr7i2j05qfN0X8NylHkM2dAvalFJXZQqofGgRtAoqeW8Kug5sU4bHG
 sN+xqwgogDJ4dJOcU0jnJv8fYQnRHAFfYYYek+wjT4B7DQqq6Hna9IWJuaEtFLaZmu7o
 BJaudMXDRGwL7x7zTZ+AoqDnt5k/7EzAAE79vZ1iDWPK93IW/l1UNKBeycwY2macDkPZ
 dnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dpxFtxxgBElM+YJglBfx04/eAo0nvXB7AnoxAb/3UH0=;
 b=ADhN/HWc4U+yqymXYMArOT8zsPtjaZDNPnGZyehnJTQxyOOnzTu2o8OiDTX9pcH/KF
 P5p1WAhtNWyYefU996DlOShgiJ2Jb9Ht8jcT+ajDuaftw53dSA6n65OCOe46qSNXVVFR
 bjW0KNL1HUxDMJW3dP1pVVAyF6BvQXDkYJZk1+89a3mS0Fe+y3IxgvvG+EBnj7y6Nz5B
 tuIvRly2pSMbuVS5gL0xS17TJeM9bSsfbqWSa95XRpEuitXygJ2J6sHWCaLCtQXb5nIB
 oM0zldJLP/8HkmmNexa3gfTc/MDPsFISRiAJFWVXd9oML1DxYYwtBD6PLdYVBWMEVdBE
 7yyA==
X-Gm-Message-State: APjAAAX5peYy3s9ha6oG2iEezkW0fV3ZNdFCo21QZHzGiDUJezh7FYQs
 rtbrDpiUtyQdP5c2LE7lpWA=
X-Google-Smtp-Source: APXvYqxAFkWBLKQ16x08JOih5XHtxlgt8S5/tHtG4Wu9OpQMLx6GJcY1sTin3i+g5nxR2RtZAzZVsA==
X-Received: by 2002:a17:90a:d58e:: with SMTP id
 v14mr16105905pju.142.1574986121012; 
 Thu, 28 Nov 2019 16:08:41 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d188sm21302075pfa.157.2019.11.28.16.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 16:08:40 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 1/2] dt-bindings: mfd: Add ast2600 to ASPEED LPC
Date: Fri, 29 Nov 2019 10:38:26 +1030
Message-Id: <20191129000827.650566-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191129000827.650566-1-joel@jms.id.au>
References: <20191129000827.650566-1-joel@jms.id.au>
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
v2: Fix cut and paste error in reset bindings
---
 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index 86446074e206..a5d89aa9a3c1 100644
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
+			"aspeed,ast2400-reset";
+			"aspeed,ast2500-reset";
+			"aspeed,ast2600-reset";
+
  - reg:			offset and length of the IP in the LHC memory region
  - #reset-controller	indicates the number of reset cells expected
 
-- 
2.24.0

