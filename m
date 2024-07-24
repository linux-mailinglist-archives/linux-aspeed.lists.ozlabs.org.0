Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2400893B540
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2024 18:50:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AfHqb1Ku;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTg4v0BHBz3cYG
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jul 2024 02:50:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AfHqb1Ku;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTg4p3J2Qz30T3
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Jul 2024 02:50:49 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-70d25b5b6b0so2636587b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2024 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721839847; x=1722444647; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+/HPmCgoLxrwovpDdzS06IFzrN+HGTkUAppXRGkfKY=;
        b=AfHqb1KuWn2PhikoyG6mjppyMRPyAaoB7+476iT+VVTEtjhG6JRdCtdy+ezLg0RC8Y
         0fhGVS8AANOfXYXUrvvM+I3P39Hl5Ni7/dbOsW/+ZRYIlG+zhZlfimOnOtt7uEmfLHmJ
         N4wHTYacvEO9DYTRtNfWJN3b9Jf5PrE8HxPZzl0yTSdnixtHWmEhXdLlHuje2btL4fCX
         yOUUJhzFhxx40WaSHUKUlVRl0yl6lwNzL1KDIcMylEe4a4lPfgWUKPv1oEHk7MT4shRZ
         IY97G8VXx42QVEJvm1uPJJBOFgV3iN3C0+09u+l0jHL+q2bohL2rWUtES4htZEFt2Jhs
         Qwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721839847; x=1722444647;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+/HPmCgoLxrwovpDdzS06IFzrN+HGTkUAppXRGkfKY=;
        b=MBA/G7Ty4sLLSkdSGdUGmina64NPTQ7eWgBpLoiXQOexnSEBqNlEUTSwFCGNUl0Lt2
         4hJnVCZKGneDXowxaHJNsDSb7DxjJERXG8giBKr67HtLKJgvrVokiOLm38JviSt2ElBo
         8DrDbKoLpa/siK1P34eBNxPvUg8qAoVFFtb1kfP8JBEGxJ+8xfLoP/+QKs8YWS+j/nxt
         IWh6MPfQIwM0o0NZ3e4uyQt1i+f5BdwfcbQQrcwWwO3FqLnK4mDALuGt1Jzq1vG7EmE1
         WsdtzZuRQCBYTeyL86FYJsz77Hlv0aw/nDh+0kDBHUBp/4WnKHXwYNj1S4aLPY/HKZ9w
         2Ktw==
X-Forwarded-Encrypted: i=1; AJvYcCX2Cf/+mP8KxLJSDWyV9rYOFBjXjhDrWcldffwmT0k0dzpZYW4EK4D4jp6C3Xb2JWMjyK6AOmN7YsH0QXcMnfylUBIXOLnGy4V1xucuMw==
X-Gm-Message-State: AOJu0YzLnDK+4ujXtAX7hxJX69f4SuQ4WjE0VT0DHEZrQKCS6HVH+Gti
	nZXL2PSDfQpeAqmqdcHTqPiUMkDfiw9eg+3WkP9tgg7dnO69o3oeaadHhg==
X-Google-Smtp-Source: AGHT+IH6vAVxaSujDvt9ylhpszDTk+b7h8yq8KkjfBp5RP7A7fWGtrv5T4SKL6KYjlEyfd7OpzE4hA==
X-Received: by 2002:a05:6a00:66e8:b0:70d:181f:c082 with SMTP id d2e1a72fcca58-70eaa87339cmr110765b3a.11.1721839846792;
        Wed, 24 Jul 2024 09:50:46 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d2f485c5csm4579942b3a.88.2024.07.24.09.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:50:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v4 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
Date: Thu, 25 Jul 2024 00:48:16 +0800
Message-Id: <20240725-potin-catalina-dts-v4-0-aa6f235a2e78@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAwoWYC/33NSw6CMBCA4auYrq2BPkRceQ/jYvoAJoGWtE2jI
 dzdwoqFcflPZr5ZSLQBbST300KCzRjRuxLifCJ6ANdbiqY0YRUTVcMEnX1CRzUkGNEBNSnSzkB
 tgbO2UTUph3OwHb539PkqPWBMPnz2H5lt079cZrSiCm5GNFKXLf7oJ8Dxov1ENi7zIyF/ErwQH
 KSSprVXo/SRWNf1C0vrWJn3AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721839844; l=1472;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=Kj4gXEfEmFE9FHoCnR3Ux9n/JpJ8gwvQUKaBEqcsWCA=;
 b=Ccey9k9Owvt9IYBGKNqT1aUICCBAqm7IP4AvtrS6itHBnDtc30iEMyGcrZPH12ca/NO3R9viZ
 TNN6r4wtzUJCLotWgUsJ4wpGXepHg1GgF5cuf20KAmvfmk//zmABIQO
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

Add Linux device tree entry related to Meta(Facebook) Catalina specific
devices connected to BMC(AST2600) SoC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v4:
- change back io_expanderX due to parser error, build passed in v4 version.
- Link to v3: https://lore.kernel.org/r/20240725-potin-catalina-dts-v3-0-3a5b5d9e6dbc@gmail.com

Changes in v3:
- rename tmp75 nodes to temperature-sensor
- rename tmp421 nodes to temperature-sensor
- rename ina230 nodes to power-sensor
- rename io_expanderX nodes to io-expanderX
- Link to v2: https://lore.kernel.org/r/20240724-potin-catalina-dts-v2-0-ba8d475c4073@gmail.com

Changes in v2:
- drop commented code in dts
- rename i2c-mux channel nodes as i2c1muxXchY
- rename gpio expander as io_expanderX
- use "stdout-path" instead of "bootargs"
- Link to v1: https://lore.kernel.org/all/20240722145857.2131100-1-potin.lai.pt@gmail.com/

---
Potin Lai (2):
      dt-bindings: arm: aspeed: add Meta Catalina board
      ARM: dts: aspeed: catalina: add Meta Catalina BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 1020 ++++++++++++++++++++
 3 files changed, 1022 insertions(+)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240724-potin-catalina-dts-fda1ea3297b1

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

