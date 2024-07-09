Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C492ADC0
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jul 2024 03:23:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nPs5UY6e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJ3C63WGdz3cRc
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jul 2024 11:22:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nPs5UY6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJ3C05zNlz30Np
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Jul 2024 11:22:51 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-70b07f27788so2547224b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Jul 2024 18:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720488168; x=1721092968; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ALdI0UctgImPzi6D1BhhRSlNPVcUa47pGds9rw5vQLw=;
        b=nPs5UY6eiSdJJCGhTrszT8yGvB4tTrG9LswlsL7Tts2qilySB3p6GmZHlBfhoCU0e5
         fN4WohzowV6eKESIlYVi3AQAmEVNtTbPGocJYfl2mCItzULMBgYeqkls/GO8byMx54q8
         R3x1kk8eJ6+hAxs5u7mGwXyXplUgQr4A+GTi3M49fIzJ8KB+8gTnG00g4dr8sEFNlzDm
         QceZjeh+s0HqqIM8LzVMwfRsYbFbE2Dh3ryw5Kt5NLc1WFkDwnkKsNGYAxnZ9I6q9/aY
         /AlRqUQN5yYxKDXpKLwIcB0ODnVu42zQmQTemY8Z1ByhnoGSrduRuTPq2SNCaPXOhcLI
         TUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720488168; x=1721092968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALdI0UctgImPzi6D1BhhRSlNPVcUa47pGds9rw5vQLw=;
        b=HLpO9uDawJbO9MCuupOQU9874ZGk792JBux9CV8tDyUBh6OrqB0suaJw8a2dPVtpmt
         Z8+rNDZNRDRYSTwHV/vb5rN67NFdrDyt4IXCO0GeVv/Iv+QNagLmHVdu/ienUiggnF4v
         HMJB8Pi9y79ISz3twBZn5gLGhFH72FuqdzfL6WCVWWMzQFovaD6P5w2GeyhqpTREVYd2
         f/nPUtXXxwXIYL2YN/E+alGPAYru6j//4qCaP1IlItDoWEZ/nq//M4SDFVoDyzo4vQga
         JO0Yx9BvkJeCtUQ/uqX9zUygNKlia/cHxTSLXacQ03WvsMJp5sdmqanIKh9OHRxOoVAF
         GjOw==
X-Gm-Message-State: AOJu0YyQltKWj5fHgHSQYXUA+2tfR6W+9hzPYsJaRU7wsdo3t9Vy3WaX
	/zhYXy/tmkItmcuNRiXwX8iUNGAyoQJKFauCks0sFpffzqzxlY4teKUzrTRlpjc=
X-Google-Smtp-Source: AGHT+IF94XayGITTJcNJD+5YvSPWF3SzKp+BdV3iLGBq2+H1893cXMfeWjxEHicL39N8sbma2rAUmg==
X-Received: by 2002:a05:6a20:3ca4:b0:1b3:d59f:2d87 with SMTP id adf61e73a8af0-1c2984e10b8mr1190308637.55.1720488167607;
        Mon, 08 Jul 2024 18:22:47 -0700 (PDT)
Received: from localhost (66.112.216.249.16clouds.com. [66.112.216.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a92a05dsm8929857a91.3.2024.07.08.18.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 18:22:47 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@ieisystem.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v3] dt-bindings: vendor-prefixes: Add prefix for ieisystem
Date: Tue,  9 Jul 2024 09:22:43 +0800
Message-Id: <20240709012243.44810-1-liuxiwei@ieisystem.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, George Liu <liuxiwei1013@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a vendor prefix entry for ieisystem

Signed-off-by: George Liu <liuxiwei1013@gmail.com>
---
v2 -> v3
 - match Signed-off-by email
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..0ffa8d06aea9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -609,6 +609,8 @@ patternProperties:
     description: IC Plus Corp.
   "^idt,.*":
     description: Integrated Device Technologies, Inc.
+  "^ieit,.*":
+    description: IEIT SYSTEMS Co.，Ltd.
   "^ifi,.*":
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
   "^ilitek,.*":
-- 
2.34.1

