Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AED493D125
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 12:29:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Crv6X9IW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVkWp2450z3dDT
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 20:29:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Crv6X9IW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVkWc6PMFz3d8D
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 20:29:16 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-396eb81a1cfso6339545ab.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 03:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721989754; x=1722594554; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=Crv6X9IWac0jLdQw4LUdSHE507JUJ03evMT/vteNC3y+BzZrxbEks387QWbLZqSZnZ
         +Ja8iwA1G0r3DOayhl4au1MkJ80v5MJxGaC3d8mGVPXG8gFPdY3tpTdrnV4hdOtOUhcA
         8Mwp+VF8QzwydYy/P7CZpT38a7jHX6D3FBJKhljTHnKsS98HZ+uGec7CAHVbixn5Twwf
         9OWo7v/2VAyZLDnBhS2lUrGGq3OC84Vys9Owltv8VuMGyBIImgZFknHkGvCD7h6u3RnB
         4twZymAglJ/BKqDyafcwzgbxYoN6Qitz80es9RA9yckXns1Y7+xgquOgu850mNPt4Jny
         Vb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721989754; x=1722594554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=LJ1JGLdJtfAxCc7LqbXYqdqVA/Cjf0e9lzEAaNC2yGrPX3VyYP4sHOzDvVctqBIffx
         sZ+JUt77EvA1PqzG+Ps1ttOprlMbMEznTumy6onCLvADQfhCryTrjuZQ8vwiAm6o9wVP
         DtvDNXIPcgw2tDdEjAOw7wtTD7j6MffXpO7K5kxwjUDP3A6VQzKX41MfZtpZr5UUzMpC
         GYKCyN3OO1RAgHCSqe/jzAA8FY+s5St87wlU6ow2+rL+HBzS87yxl4Y88FkD7WWJAmTT
         mE1c3IxOem0YYDzxzORmqJyv1KGOmpelxcimms+zWsKz3JRXQ9506wHy/hfhCAbZdJxM
         MYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX782wTbiaadyACb/9MjsNQzLKL6QiTAyvcnKVqMNcfFmQqWFh5c2yT9syQtJaKYtsNZtxd+toiGlsoBlFxrbB89uPt/S4aXzd9uPMlNg==
X-Gm-Message-State: AOJu0Yx0LbnlH2aYZHEWFZUuPTrYV4aLzcobuFfl5w/tYZ75i7VcQxRX
	ACpbBKejS2cGr9CoP3Sk5qIpbX9/wYKT6E7n3z3Zhcz1fIpq87vv
X-Google-Smtp-Source: AGHT+IGL5Wz7SK5HnNaFxr4tWNWoZyb/iwi8Is28PgzJgfNiyQ2NMPaFHSayXINvdntswaZhn5+2ug==
X-Received: by 2002:a92:cda6:0:b0:39a:e984:1caa with SMTP id e9e14a558f8ab-39ae9841e03mr8473545ab.21.1721989753838;
        Fri, 26 Jul 2024 03:29:13 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8116a4sm2406545b3a.130.2024.07.26.03.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 03:29:13 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 26 Jul 2024 18:26:49 +0800
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Meta Catalina board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-potin-catalina-dts-v5-1-8f02305af527@gmail.com>
References: <20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com>
In-Reply-To: <20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721989748; l=879;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=wZM6LoO4PA/XB4ycTumABemVy7G9m8wLw28advUxNRg=;
 b=5QKNyRNZt9BW6GvgGUgynM1cwzH/rsy/7kmWy8JPZpgpt3jKvQhpuHdYSk/z5KT6XLQVKGcqP
 tFWXYBe5xlvDWJzEs0+3Qg+qyAeObNJJDMpdoXciLeeqpAhq8WAG21a
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

