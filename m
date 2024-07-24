Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64693B4DB
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2024 18:22:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VYL/TkFU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTfRW69Xmz3cmr
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jul 2024 02:21:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VYL/TkFU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTfRK6BS0z3cCS
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Jul 2024 02:21:49 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc692abba4so18623185ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2024 09:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721838107; x=1722442907; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=VYL/TkFUNrHdbO1GiUeq2+3JcSTn7GAjZDJ/P31LbvvclOO9JIBuGEuzCzR9P2mTwr
         EyXQ5yC2IYy3D1T7PTOibQU+0D+dfyawU0+k8/VFYWnrJvq5iBJwrk24K2R1rstG2TcK
         6+J15ODPvoswwG5n4cNMGGx2AGMAtmPyNrYd3R4K35Z7ZpUtn7tr3gw9KvzAVK2QEGLc
         iL1SbhdUqejChkbpP44naK7/3wrUzZS3UJ68+94cvEuPBR8gIS7UcwYt3dPPzVxR5jUn
         fFWkBVuyZ0mnpp89otXTDoT81+XmGYJ0PCXX+6RTJKTOb3GtKBSCRnA425U8JMO2p5MG
         HuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721838107; x=1722442907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=aEVOxvyYi8JoQmJlOgFKHXKEzAx3Fxb7Hyb1yUhftYS03ljTwa+jFxMdO7G5pay5Jl
         jUlhrY71ku1+JrpA9ttMeTiPDyqj9/HSD9gWZRgKBesUhnCgopyldDn1O0Br4wyd3hDP
         Ep2PioIw6YJ33o8trS8EmOHk6lcL/MqX9uQqqrhGziDvtW+SEiTNUDx5w42V9lKqJ7BL
         b+Iq400JPT+hsGC/KNUXL/OQn6n6KSeNTyXSCy1ugiNxB3kPSOyjVjx+yYmub1L/JtdG
         t3zHoilHlsX7wk2G+SzV1p4LdbwhAB+21DamLYqxBkPLMSLZ/PXJMrN5r6gAB0bhqW66
         8kjg==
X-Forwarded-Encrypted: i=1; AJvYcCWv5M9ocJYXu2Otq+Je2Tm1RmpP8no7+9nM4BBLIlxTsDrUf3miqZPJlibkGhyp+QLctia4Kb7MenYahHUHsDWMSQ/t+tivz/PXd509ug==
X-Gm-Message-State: AOJu0YxmmscGmOsIcgff2NxybtuY8Cf2LNXtiV2uXUkjs/Fl8sNzYjdA
	e9P9zqEocUeuXDVl75iO/20nYUwxprN7TEYfrgtvYNOh8CFt7py6
X-Google-Smtp-Source: AGHT+IFmVIq5MOZhwZyzNj4etEKw4pDAYhrD19DihoWnrKMd9HnKB5MUCa+wcdkSrdKEF8iYenhk7A==
X-Received: by 2002:a17:902:e888:b0:1fb:5c3d:b8ea with SMTP id d9443c01a7336-1fed3535eafmr743755ad.13.1721838107318;
        Wed, 24 Jul 2024 09:21:47 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f31bd9bsm96159635ad.157.2024.07.24.09.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:21:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 25 Jul 2024 00:19:18 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Catalina board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-potin-catalina-dts-v3-1-3a5b5d9e6dbc@gmail.com>
References: <20240725-potin-catalina-dts-v3-0-3a5b5d9e6dbc@gmail.com>
In-Reply-To: <20240725-potin-catalina-dts-v3-0-3a5b5d9e6dbc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721838101; l=879;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=wZM6LoO4PA/XB4ycTumABemVy7G9m8wLw28advUxNRg=;
 b=pzmrDzs5Wf7+kxOibz7dBQF7gqeY9uc8vV6GVQ5gVwU7v28vmMO1husytU5+wmD+6JGq+/z2u
 f6qQObBSCYJDC+FDFDmymIQa/hm1A0ZwkBoAWL7s+bKlP7ddb57Sbv+
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

