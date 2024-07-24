Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4CE93B542
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2024 18:51:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FpgXgwOz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTg4z2dXmz3clw
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jul 2024 02:50:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FpgXgwOz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTg4r314dz3c6c
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Jul 2024 02:50:52 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70aec66c936so11691b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2024 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721839850; x=1722444650; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=FpgXgwOzOogAIidx12W/8HtIfvMtxX+nm3aSeI5MljYYuASnWL8qndpstsj39G/ngs
         nhr+dj9I7CSiLldmmLh2tZDlhha0hwWl8k+DlwVCJ6rThZEUue9ZB5/IUF/Dg0pRyY8Q
         jDMUMYM5SAfOwkSRDvmUSEiNr8Cv+4N+AmLQtHValRumsyVnzjJer2ZUZAbMhMAw9Urr
         1Yhwg5y2y9xpJ2NWSBIwdLaKrYJMw+B1iRJnyrx7Tdoh5iZCTyIFfje4SurMl+hIfOS/
         +gkqdh+NbrkrDScVqcR6hM11oYwW0MWdRZlJpNl0HSRtFcJ/7JBuxoxFEdTsWpUDflVC
         8RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721839850; x=1722444650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzCkDzQg10EK8n1YgINi+79HQeehaLLCfYvwgSxxax8=;
        b=lcp99cRnlczKdGG1VCv5v3ku8dIjSEBub2hvIjFYSQMjG5Te8Vx8AF8IEAiVdlkePU
         xN/S7fqYK1OIKAZj0gK5csTOlQHmj3PWX87DPa9ku5MK/MhPDGoj0yrvFiP5JNaTVnHR
         soqPbF6yujqijW03E3rG27caP/q0yTqKp1GHN63nmOdWPnS+QFAkMlGx+L2RercLk6dr
         ntQGsyKs2Bf4VoADzv8r0CPeSPcw+YNaJWR0mkrQ3miuDmslalohKEACoDOERRUrzYaZ
         FUpNVsL6JBXTldyXMVoJCTiF2/R288qLUC1cFKqr3sQedRlHzk2JTsi+yeLqw8gnI3wF
         B/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5YD1S+BLznLJZXxTV7olsM04WZVf1noWHjIguVgNCfKQGIecQtQGMA+Df0ghSkjINDHHLMxVDQ8/Ej+9W0eq16vDBv/3wvP2DWUvnaw==
X-Gm-Message-State: AOJu0YztHw0fY02jD/E4wKcPgCdS+/TzMXnQP1kXbbfr99q0dhP6/JKg
	/gaDjGC8Zu0YRQ79qqpnNzsceJGjgOXAN92toOFRqRetWQnaTW0f
X-Google-Smtp-Source: AGHT+IEpjLX6VKacK3ty02j3t9wkX4X3oc6gowuWunqvt8WcKyw2oY/PJBPLvXyD3bOF/ChUp144BA==
X-Received: by 2002:a05:6a00:1881:b0:70e:98e2:fe3c with SMTP id d2e1a72fcca58-70eaa831b6amr138533b3a.2.1721839849641;
        Wed, 24 Jul 2024 09:50:49 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d2f485c5csm4579942b3a.88.2024.07.24.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:50:49 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 25 Jul 2024 00:48:17 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta Catalina board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-potin-catalina-dts-v4-1-aa6f235a2e78@gmail.com>
References: <20240725-potin-catalina-dts-v4-0-aa6f235a2e78@gmail.com>
In-Reply-To: <20240725-potin-catalina-dts-v4-0-aa6f235a2e78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721839844; l=879;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=wZM6LoO4PA/XB4ycTumABemVy7G9m8wLw28advUxNRg=;
 b=/5fMQLxXc+LmBfipSSbq7LI5av5gqcHxlab9BDiRcDmWXBI5HhNrwTMgkeF93+Yiq25eO4ybg
 zAL4ckrDfvjCmRxejgkz/GYNvc0RHyBohJpaII1Vc3XIux9li83Bn9N
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

