Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6493AD51
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2024 09:44:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OvtRAaFd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTQyF3V4Gz3d8M
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2024 17:44:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OvtRAaFd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTQy52MQlz3cRr
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2024 17:44:13 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso1226778a12.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2024 00:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721807051; x=1722411851; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=OvtRAaFdzOQfb2go12l7EIqmGVFOls+DvmV/HpACk9dZMlQC+TqLGEsrlNiUFDM7si
         ry6T4WL3eP5b2uu4OUt9uLO2w1zrLPEHm/LSJl19+nOPklTDeDb7Lx3p3TRs/tUMe85F
         CPSfjLzEabEbLezD4AU+Jc31aH/EhBSHbc/jKV23AQ6x2JEomm9ssNQm2hN45yO4WNAZ
         h2xVsGPLy5pmNPkazT3mpVn9LCuF4gkHQbyAYQKtwIP8Wqoq1razYHLfrL4FYZKc+tUQ
         uHRmoGMcnXCeXsyxt5DaneMIW5+zoj9aLEE/QtZ3ZSX8yzx21k04kl7wqNwmTmPOtzE6
         H2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721807051; x=1722411851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=vVA6PiZjdbKtI+7YGq9ax0LvVe/wFA2lJ9QMBvRg4flsHX92wsM1eTrgERuvLcNkoS
         0+JNsnUVxiebiKM6SiqMDzctEJyUJB0Dnqy2nORSojWWrfsIT40wsD+aKrxqprOVPTdx
         hRf0LD6kqmidXHzkME3UYh446hhnNjjG7k+vEINk8VmnjkEN835p3gANXFvJwoM1IqaJ
         NEVQHy51SYft7+qipOhkPM6jKQlhBXUqqE8nfQAI6aJ0a+rcrXQsiDpGL37Y5IPZdjp4
         tag7fPhZNGODq6A/GXlvi+PavOmG+nS0d0aNufLPbVonAVN0JFZJqlx47Ses/2bSpfgB
         MDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFZmq4gTwAcMVV40Vb16FtvGLSK9f+lkITb42fqxViSnjI0psTNtcK2FTENajem4mhk8MDwVU1i8n5N0hyzrypHk2eFik9ak2/RNfJ/w==
X-Gm-Message-State: AOJu0YwFVmjy2THHKRScVajoWms/tUvUHUjZ9dIyrL3LiIPDxCFGBy9d
	LtQCgT3MPpyFy44arzDEpQgfj7TU8QZ9MSCPHjwwuOTcYRJBbvSB
X-Google-Smtp-Source: AGHT+IH8CIR3C99/0tJLuAiMGkw32cnrVweV/bSOv9E/oT9iydHKNnO+muDZhpdC3V9xHc6tq8MqzQ==
X-Received: by 2002:a17:90a:9e2:b0:2c9:8a29:b189 with SMTP id 98e67ed59e1d1-2cdb51a5fdbmr1438801a91.31.1721807050838;
        Wed, 24 Jul 2024 00:44:10 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb74b9ed5sm901067a91.49.2024.07.24.00.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 00:44:10 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 24 Jul 2024 15:41:45 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Catalina board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-potin-catalina-dts-v2-1-ba8d475c4073@gmail.com>
References: <20240724-potin-catalina-dts-v2-0-ba8d475c4073@gmail.com>
In-Reply-To: <20240724-potin-catalina-dts-v2-0-ba8d475c4073@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721807045; l=879;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=wZM6LoO4PA/XB4ycTumABemVy7G9m8wLw28advUxNRg=;
 b=YXZ0dJsps4dfzJAmURmRwKSr++edNGb55ka5r/MVbc+pQf63V9iEhtwmo/imtpO5LNcL1KdGd
 J2I1akelX6xDJTm3A8hvvTKosFiDf12W2RV7qKRpxzfa7V1u2ZYiY31
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Cosmo Chou <cosmo.chou@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Meta Catalina.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 95113df178cc..f1bc2bb7b670 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - aspeed,ast2600-evb-a1
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
+              - facebook,catalina-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.31.1

