Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A70EE271EB6
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 11:17:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvzNM46BfzDqTM
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 19:17:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=luceUTko; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvzNG0YD5zDqTQ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 19:17:00 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id t14so8472549pgl.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 02:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIhrg8tRGQCxs5Sa82o6WHubo3OlUJFmsl/2L8gztn8=;
 b=luceUTkoW+9pCSILD5AJicH1J7GUxI+drnA7b7xnLPdudcjaTLtZDZEXBBcaCOHK3/
 eJ/HTzvjz30J6sVCL0gS4tX6QBRAOUnOf8CfiwxIhqPir5iQvrDuLvoG0ZOP9eZKxhUU
 lNzz1Fny3mKw/eNJ7r9UIP8gZPM7MWUvt4UYahlSDRhR2BV3H8ngmzyQ47fD9dFPW+c7
 am4R1V0XmCL84wJjCpaosxDc9zMPkgmgQCJwDWMfAWacXXJpcd1VVfrBENnJmSCKQIMF
 4yZZAJ3pFHuKsQ3gbrycfl0p1pS7cBuh7byMcYJCwBa4LGhMzyiPyUp5Oqm2lsQq3p3w
 phIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HIhrg8tRGQCxs5Sa82o6WHubo3OlUJFmsl/2L8gztn8=;
 b=YzaF+KhE/UJAi7XOmsmpfvFQsWY++gtGox3Ok4892eaxAU8C6+I/Oz+CAG1O0+Iidl
 lkkEtICMJfhQo2D0szX0cP/K/02znVr1hZ9xRbp/TzraJKthq2fn5JH4SFvk8VfzdnEY
 nGpraV/qmvQM8UweqD9FBhzsoblk0zngpRS/lK1Zd7pAokjw4B2BC0hJeJhAQ0+5IEcm
 86UDZGRPDGbMIbfuhLEIlURcvHqd9xANrZnkakehZYDsXShrL//feP1qJ/eNOwBiqyBV
 Ni5swwulBrsdXPFMjaKQgczm8ZUQ+0SoMeCnaVnTo2G23N860FZK3L0Gq0F9gdWdIBMU
 WeHg==
X-Gm-Message-State: AOAM532U2Zzjq37BggbvEVRZnpOyVvqbz1dZ+1dW2VJFt7VKlvAYf2Zi
 Jq3pgRiqUIyJcScv5YgkMTCbGwWrLVY=
X-Google-Smtp-Source: ABdhPJwkuFJnVm4iQza9Qo50hDygKfc4y7LOKZiXmom/SbE+SshwfyezqsxBfCvXn2jybxjLYwRgug==
X-Received: by 2002:a17:902:b286:b029:d2:29fc:c89c with SMTP id
 u6-20020a170902b286b02900d229fcc89cmr2287067plr.3.1600679818365; 
 Mon, 21 Sep 2020 02:16:58 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id gb19sm10105690pjb.38.2020.09.21.02.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 02:16:57 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 1/3] dt-bindings: aspeed: Add silicon id node to SCU
Date: Mon, 21 Sep 2020 18:46:42 +0930
Message-Id: <20200921091644.133107-2-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921091644.133107-1-joel@jms.id.au>
References: <20200921091644.133107-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Different ASPEED families have various unique hardware silicon
identifiers within the SoC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Fix 2500 string
 - Be explicit about which ast2600 register to use
---
 .../devicetree/bindings/mfd/aspeed-scu.txt    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
index 4d92c0bb6687..857ee33f7329 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
@@ -20,3 +20,29 @@ syscon: syscon@1e6e2000 {
 	#clock-cells = <1>;
 	#reset-cells = <1>;
 };
+
+Silicon ID
+-----------------
+
+Families have unique hardware silicon identifiers within the SoC.
+
+Required properties:
+
+ - compatible:		"aspeed,silicon-id" or:
+			"aspeed,ast2400-silicon-id" or
+			"aspeed,ast2500-silicon-id" or
+			"aspeed,ast2600-silicon-id"
+
+ - reg:			offset and length of the silicon id information
+			optionally, a second offset and length describes the unique chip id
+
+			The reg should be the unique silicon id register, and
+			not backwards compatible one in eg. the 2600.
+
+Example:
+
+
+silicon-id@7c {
+        compatible = "aspeed,ast2500-silicon-id", "aspeed,silicon-id";
+        reg = <0x7c 0x4 0x150 0x8>;
+};
-- 
2.28.0

