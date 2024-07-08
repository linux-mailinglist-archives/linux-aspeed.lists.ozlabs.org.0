Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B75EC929B27
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jul 2024 05:49:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dogJhyLY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHVV43PQ1z3cXD
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jul 2024 13:49:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dogJhyLY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHVV00FS2z3c4h
	for <linux-aspeed@lists.ozlabs.org>; Mon,  8 Jul 2024 13:48:55 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-70b0ebd1ef9so1264587b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 07 Jul 2024 20:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720410532; x=1721015332; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0qY0eq/bCYTLQqVWP+SkvvD807zfIcKNdRibSQIaU4=;
        b=dogJhyLYjFIk9apcz4qfGPWfiJKAtqQbWY9gBbHNCk1Iaw9qH+yC0/RN9GVujdmqzW
         fffKgyPTyWuQlTfI2gwM10qI5s8Can/+H5D8bUZeWWS16M/SIIvncHQ+ZFBLTW82fXRh
         DrZ47+IN7ADZ8wClwe1T/QlQerq3HVPRCQ/c8vdC6D8ylGoLUexjNQZkEAwluZpGN0Mk
         nm+FB8h1ZQu/LUSJ3SlcsAa4l2bDmBrbQwyXtBEMzf4JgGzMJz/GYZ/QVaelKaL0PDaS
         C76WAJpd2o6ee6Jz9Z5AbLmPA2M4Vq+5vTdXL6Xs3s/Rgf3hyKax27F8POBrDs1BXZFZ
         re5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720410532; x=1721015332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0qY0eq/bCYTLQqVWP+SkvvD807zfIcKNdRibSQIaU4=;
        b=Aj9EyV6Ay5O8nIs8+BCijhKomh1xcazKEdXVZCZtuhuP41P7jEE5krQJfl2atghkw6
         /SSksJip0wTSLEqzifdjA+N7ICMX+8/PGZdsb7m34RoUArkO7VD0seMRs5F5yxH6q2hZ
         P1ZxC62lPH8ObHLnJFfXAgxnhKnzAIEM8nCeGIXi4i3kPRpQyIz7mqThdCvACXFbEhRX
         0UzWztXKYsHoMT3r/2wpJhqnFvmb+pSRcgYa19GkgI2EkexTs9CQp6qG61g8tM7qe2TV
         LAwBarn36/uGDZqDS5iMxZVcKqto0cPyrkxPfC68mPQLtWC7aM6zYEGfxx8Vd+avb53r
         w8sw==
X-Gm-Message-State: AOJu0YzEqHttG7MkvusNCcPIYzUkKh7ndWdSAQS47BjxCQZH3vNHb7kA
	BlaT2hCBTaGv9Uf/Y8Ar2MXM23GObSER7aKIkn4iqavc7VDgRWtgE+CQtIVI
X-Google-Smtp-Source: AGHT+IGHpvTAZEYiOcCH84LBE7U4kiNjB0dWQavoCxPd59xGuk85zXCbRWBVX9b9HASK128Gl+V5pg==
X-Received: by 2002:a05:6a20:734b:b0:1c2:8904:14c2 with SMTP id adf61e73a8af0-1c2890416b9mr875148637.37.1720410532123;
        Sun, 07 Jul 2024 20:48:52 -0700 (PDT)
Received: from localhost (66.112.216.249.16clouds.com. [66.112.216.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a961f50sm7103416a91.21.2024.07.07.20.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 20:48:51 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@ieisystem.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2] dt-bindings: arm: aspeed: add IEIT x86 platform BMC boards
Date: Mon,  8 Jul 2024 11:48:48 +0800
Message-Id: <20240708034848.100930-1-liuxiwei@ieisystem.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on the ieisystems

Signed-off-by: George Liu <liuxiwei@ieisystem.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e386d0ebfb14..818fbe9c45fc 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - ibm,rainier-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
+              - ieit,nf5280m7-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-- 
2.34.1

