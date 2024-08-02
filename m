Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C05C4945A88
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 11:11:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IGpr6MDD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb0S81YTjz3dTP
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 19:11:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IGpr6MDD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb0Ry2kSnz3dL2
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 19:10:53 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-70d1c655141so6077221b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 02 Aug 2024 02:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722589851; x=1723194651; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=IGpr6MDD3xySGpc7Eov24/vIe5nUkyN7GmEkGCG5XOCvoSWeqcwyrZY7P6IW9Bzf1D
         eq8NxYknfDZgy7/ygfX3bLZqNp9NtEgCtWpTTizar7sj/l6LGjcab6cD4kcDsuSlb2bq
         Gxmpgj+uGxoZXE/nEBZcpe4Hipnuor+1eEAvTLFrCpbISlxTgBbUzTBa4IyhL+FsNaPe
         vdP45lHk5+t5n8XSQQXhIKhLpSqMTgLO6+v3+mjdxviqupzyvaG33dDcpglpwdOVeGLw
         eUS7PIIett+1jkEOKr/ptSngq+xlM5887/r1adYPDsAPmC8SNTNd9WHK2T6kftBBya1g
         WM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722589851; x=1723194651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=cbj0eJbKis4+1cBJwLX/8wOldMZsw/DyIPNCJS+WNbCRCu5mOnFqPIDXDVW8YCxz3I
         JndIT3Pbn56GLJ3SulTgOf2VCoryk4LY5+Ud9+yipVSYzQ8ZR3hyj67phu507olLQNTV
         VRUQ1XObYQSzEL/8rD1krHnvaXfC/V0U/ePzJLVTIC99quA++b7TuIRcD+d/jSEeMxkX
         6DB+mzOxO68KPPqz6r8V2oeTACbBhFsQ/IenWKT1u5t1njLNqXrQh/2yIBZxmCGIHBNe
         zgoKHuEI+UmKHsWaYhEP5R8UZTDk8t3hnS5eHP/RQWCd8WabahMkc52prZt2sQn/3O5P
         REHA==
X-Forwarded-Encrypted: i=1; AJvYcCX9sj5vyCQ8tgrDskU7Jt13WUyjL61hKt96dUu03EPy/Ylk+qBZhNEk2lE1+X/JLE8APvIZa+a/HTilWW4+lhtxlYNE32okcU3slQk/aw==
X-Gm-Message-State: AOJu0YzImjHNaVppAYQDjphZLl27u23FYWRyusXsro2MDdczATl6eQii
	R2C0DZ97eCyjzgOmFnB05pduT8I2nTGFMKsIcw5LkSJNRHiBCUA5
X-Google-Smtp-Source: AGHT+IEFrmC7YhTZ2p/did8YcX/HUIj/lWUcw4s2YvO23C207GBu2bgytaE/SHvIcFBVT2LAUaUTHQ==
X-Received: by 2002:a05:6a00:14c8:b0:70e:91ca:32ab with SMTP id d2e1a72fcca58-7106cf8ffa6mr4213333b3a.6.1722589850930;
        Fri, 02 Aug 2024 02:10:50 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec05bf3sm1034145b3a.13.2024.08.02.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 02:10:50 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 02 Aug 2024 17:07:47 +0800
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta Catalina board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-potin-catalina-dts-v6-1-0b8f61b80688@gmail.com>
References: <20240802-potin-catalina-dts-v6-0-0b8f61b80688@gmail.com>
In-Reply-To: <20240802-potin-catalina-dts-v6-0-0b8f61b80688@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722589845; l=879;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=wZM6LoO4PA/XB4ycTumABemVy7G9m8wLw28advUxNRg=;
 b=85T95yZ+AIPCpHbO25SIMKP97TSUcCuT+AHc1DKJHL7+qR+pWCl2q4sTdViovOSvZVwX1Rxsp
 qPT47Nah2KSBWERvs6/j+Vz224agt9SYUsLu8IFqoyGRW71Qh2CprmA
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

