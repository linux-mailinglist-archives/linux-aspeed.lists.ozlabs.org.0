Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E90326BFA9
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 10:47:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrtyZ4pmgzDqPf
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 18:47:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TszW/Mbo; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrtyP1J6ZzDq9R
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 18:47:25 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id k14so3494856pgi.9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 01:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pHK7taTCw9nSBaBjuGMlwJwFvRIpsgkWzFQ7ZL1+xd4=;
 b=TszW/MboMkw7QtAHY0aBHMn+cYGx1Ew9jX44vDWBD5q1u/ecQYqbOJ4jDsWgn1Hf4o
 7wV3dKbiAQpFct7IGBzwFk6UR+50o/iAE/GtGpK7WyXyBEWkIbQTyV54Tk1k0Axc8MzI
 FW1kIiaqKeF9ry2HecCXbZ82xEbnTWbDS2js38l/bC1/xGehGttGV8B+bG2uHHFp3Kw6
 24Y5vjoSwYLIiAkwlN9ohYeutWM3bIyEzFfefMPWreQmbe9g3wMXCk1/yk5AFzWMgs8e
 p66Ulc8ghcG48X7nvVWama7+q1Fxuk2wilizbSBiI8dQ+BOhHPwxeV4nuPEG6MhJGdSY
 3uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pHK7taTCw9nSBaBjuGMlwJwFvRIpsgkWzFQ7ZL1+xd4=;
 b=fq5MEa9sfw1CrjZp8poXKD6oeK0YDJG6OInk5cNxHv8+nq3IHuWfu7Xy3upUIpo7DB
 kuykxbI35AJtiiNlNyCmVuSq1Jb02mBdR7gFkGDbkIns410ut52DUz8OJ9H3bZ+9i5d1
 UVIYW+CJtOP1TZZlkvriD1pcj+iRqQ/Few+iQJ8we9BFKotQqaG3tDfS1EEMzOQPNDu0
 HwKl/cqR191S3UMuhZYNeiCr2NLQQvcXlXEUkO0L0cAdpnVstoHO4asol3MRm6U5JqC7
 iVpojqaSw5NaMtFvUpn6unEhJRUZD9yhc/mj4iloFVs6ZfZY2FY6DGk+XDxe+6IH7OBK
 xiVA==
X-Gm-Message-State: AOAM532BNXDLlfmVNpmE4L6JlxGa1oEKkt7ZkV/kUHbECMVjpTjuXiQe
 /JGdhpSEWv05VSVKoaM7Pvg=
X-Google-Smtp-Source: ABdhPJyMneAW/o+OiG0mNVCMTpMZMjrGqowzwtjmuV3KH8FIuw29RrGq70WNLOHyuqYDwBD5iKXudQ==
X-Received: by 2002:a63:8f0e:: with SMTP id n14mr17997425pgd.211.1600246042668; 
 Wed, 16 Sep 2020 01:47:22 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id kf10sm1925323pjb.2.2020.09.16.01.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 01:47:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: aspeed: Add silicon id node to SCU
Date: Wed, 16 Sep 2020 18:17:01 +0930
Message-Id: <20200916084703.778386-2-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916084703.778386-1-joel@jms.id.au>
References: <20200916084703.778386-1-joel@jms.id.au>
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

Different Aspeed families have various unique hardware silicon
identifiers within the SoC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/mfd/aspeed-scu.txt    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
index 4d92c0bb6687..fff3151f06ee 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
@@ -20,3 +20,26 @@ syscon: syscon@1e6e2000 {
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
+			"aspeed,ast2501-silicon-id" or
+			"aspeed,ast2600-silicon-id"
+
+ - reg:			offset and length of the silicon id information
+			optionally, a second offset and length describes the unique chip id
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

