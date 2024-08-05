Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA9947E93
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2024 17:49:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=It3O/2SD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd1881SwQz3cft
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Aug 2024 01:49:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=It3O/2SD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd1832k4Kz3cCb
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Aug 2024 01:49:06 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fc56fd4de1so40336125ad.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Aug 2024 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722872944; x=1723477744; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=It3O/2SDUuoySe+1Vlk2I9EtAl+G9reVM4Mt40LeeivJ8HSl5XkWAOy1VEJiyUoxaI
         msH+CnuO1HMvKZ2JzmERJzjCvBqujB9eHu8IkY1ScapSKoI7JrSu4MWCV4ZuFgE0A9NF
         kiOY8By8CuHj1jTyuslfr5AHhSptPvH9MlOy5kw8GBtlrBkGbyHqEpl2UQhTajtrcD//
         0i/9yokXFNYrloahzCE9V7Uj8Fl7sJdpgqCTGn0KAev1JEacOrPQQpLNIgVwDKlUOne2
         Sod1rzEcZtqH690fhRtqg3c+ahWuV8ITSrfyZO4f8M586HeUMyX4itGVyyN9UFkQmUO1
         o1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872944; x=1723477744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=XiN39itSmJYUNGEMX/hFPw1FIaiZPWSCxHGzM5X2OuTVf6I2hinL+XboXAJL21X8eD
         9CAzBQ6M6gIafSvnrTTqvQS7yH5/QlTsG/PKEN8MhRuys7N2iyMFxNhKwletfysO0fwa
         GgJ7fnhTv2KsVAAkM4Sp5g1qYbDGZNC6G/F7TXrz2Lujc+UCwKGO7hW/u/2oF4fljqwR
         n7VuCARZFweIJea4VeoK3t1SRP1XvcQVCFYUEXYoqQfEVvewao39OEHvURi8yk9KABF4
         3uCiUh+hVvR3U4OWSAyYe1KU1A4yVEluWkxF+9qf1l0ZSqcQbNDi7Ok1fxsHYoT1bCKk
         H8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUwQEJdt/FFl33hynpK17pQZs9ZYTZp+RplId5H2g5IdQxtEbyE+HNhqNuVIL9u01Pcv+Huy9dDhUWe4jnkqpCMsap1jG0NezDKh1QxaA==
X-Gm-Message-State: AOJu0Yw+56cmKNnxj2lqcw4gQ5FXy9fjo8J1t0oFOBZo567r4QKTC4Iu
	qHYMYIU8pmkkqCByy41DS6nKo3oDRPlupA6iMnSyeBFr3bdidiIl
X-Google-Smtp-Source: AGHT+IEbBInNiyR5FNrttMEq3Izoz/xBu86bXwbBWqbgHPTmugXRpKfArkyJZGwciwHb0WrUgehH5w==
X-Received: by 2002:a17:903:32cd:b0:1fc:4aa0:fad2 with SMTP id d9443c01a7336-1ff57b5f1f4mr200027445ad.6.1722872943753;
        Mon, 05 Aug 2024 08:49:03 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929ad84sm69478215ad.270.2024.08.05.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 08:49:03 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 05 Aug 2024 23:46:27 +0800
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Meta Catalina board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-potin-catalina-dts-v7-1-286bfd2ab93b@gmail.com>
References: <20240805-potin-catalina-dts-v7-0-286bfd2ab93b@gmail.com>
In-Reply-To: <20240805-potin-catalina-dts-v7-0-286bfd2ab93b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722872938; l=879;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=wZM6LoO4PA/XB4ycTumABemVy7G9m8wLw28advUxNRg=;
 b=1jvwXgN09RI/PUSMDxEF1b/e22yrfVHmgXfKIdE8FpYjO++fxRG2ixrBd56+q8BJrBLm4PljI
 kfYOpLy755kALVXkWC6an8ELkWYrHjrFIvMaFjTDyw31O1FFouHBp75
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

