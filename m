Return-Path: <linux-aspeed+bounces-3545-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJGEIa7dnGl/LwQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3545-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Feb 2026 00:07:26 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C47EF17ED52
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Feb 2026 00:07:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKc1N7362z3cCh;
	Tue, 24 Feb 2026 10:06:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771845473;
	cv=none; b=bcIdhlxavPC1pJwyky3wAWFX5vZFICUb9z7hagc6/9om0mMFaTXgSOFocumog/lgjy8WDtDCV+7k6FOuEnjXQX/x9DlepIH+TInc4Fe3SmcvCiCU/At7PTV8O5x6PTwp9eCP2cNNs53W/WNzLsECD41cXiZiGyEtg9Bd/Rc4WGilPm+QgdebvNe7D0+Q0I7taZ4weF/FSf6aehDZJg3gB9L6pSaGh0emU18eL7cb8hG3Kzugd6QcduC+Dnd4rM3cILsKHrj8coIrnoJ5JuWUtIMrwdzLygRF7Yj6aqirON6ahl4RQ9gX6mDZxAMq5/6AwOCsui710zxL13SKmOYqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771845473; c=relaxed/relaxed;
	bh=hRCjL+EE42kWhMnb2piV+g1yh/Py8//tJ9ex6KvyCIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DP/sQid99uu60P7jvYxPg5Pa0zMR1Iv92PhQtXBnmzvyzkH27nsbC7LxKTYsFLm4bCQLOhka/3Os2AFgefVTj5GO1zEKGVL+M1hr9TS13BWcTVrTRDYEco7rDRV0ec4yzoA+fioX5Y3JGwSOKwzgSS7wZoEdzZ5YcgCCPNNORpdG0RdGZ7QxyqmHZ9zTMrqe7jNuLiPfq4SbUjcEyfj799orrfCaPsZ7hJcD5Rqms87lYBmrgaNjYK+gYrhoBEmu8k2jbUEQfOqpmMGJSZRtpaQwVjOKus63NYGL7gDqDbw7ILfl0L/AZcHuiryPWfsVXA/Fi134fM4owRXzCLEWnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AP51XXXj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AP51XXXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKJHP2VRfz2xN8
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Feb 2026 22:17:53 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2aadc18f230so25771675ad.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Feb 2026 03:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845471; x=1772450271; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRCjL+EE42kWhMnb2piV+g1yh/Py8//tJ9ex6KvyCIo=;
        b=AP51XXXjbxsY36VGg3GJvmyIrgcCtQDleAga5Y71ledYq9ce9YD8JpkmQoEjd+lPA0
         +rgXQzGf5A2yo0D8zPk+bbx4/o5hpC6GZ3RvCS+3hnpnK8NsBbDQshwHhJE4NJtx1RoD
         PxzE+WuEARF5Gaoosw1BtCuNLKSISrx2A+E79GK7pOopzxs0IDIzusk4n1eRMgvcUBHO
         3/UB1/nT7oV7CIr7y59Ref8DZi8LYNl9b7IRD0tBt9NmADuGCt4ByUTZnVF09qbrBp6F
         90f8BKcbD9CZndaMDVz9u2U244GcFslC5kI0BBwn632gl+Yi2t1O5plBqb/v4PvERHkn
         7k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845471; x=1772450271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hRCjL+EE42kWhMnb2piV+g1yh/Py8//tJ9ex6KvyCIo=;
        b=TkbFSIhmbbhOXh3ZAnhc57l6MJHvQTrMybiW0bsfVFoHPKfR0g4nUesl74AQSQwJly
         vqv/ttBajlh3Z4T2A5E98Zih327oPhQ23uiYC3boftsd6rOEkes9B5TVF023Yyl68FPv
         ldOBb//s0QzLhHfCPOmPSAC98lW7Vqzg29JKt4KK01bFcJd7CgkHv8csIiukHK82M0X1
         7RRWwR0AHP0fNdmI/7ouDCLnOySeaOerY/A0tqGf7CTxBoclmD5BGzanw9SeqkYijVaA
         52k+R7E3BO0btjJt65daLyGVstURjxhN6MLob7slZFwKVJ94X38zVEVspq8f4RbKJLMb
         Cxkw==
X-Forwarded-Encrypted: i=1; AJvYcCW1KcaXDSLHm9V4p2qdS1tKMRvfV+tKcxxn3V7gpp/m0ZOmGCqBtIutIOmVSTYwGoDvDtPFfQxs92JhepU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+v+93/+qTtOsR9cPXVcwn8w4qC81EmntJ1d5XWMzXVf/9bODz
	Tt2df9Gr4noXIa03xW0/KLG7SJzpxjSbC7MplvU2Tlb9De7KyQIw0E8l
X-Gm-Gg: ATEYQzw+GkhzJ/MYj/lGoLNQ4P5ltP54aMjs6s/E+lYlJl93jD84jnFvczLOxiFOVHO
	dy0+Fb+MIJvr/icjpblpoZc7MxrLaIvyh1hPKAO4IbpYjUDh03JkH2i++1VJwl7ZL7/7XYbL7DV
	Z6t3CXPyjHxd2qqpAJpqEwSfyw2u5312BRaOp42FvOJexMJsD0WBjZpj/dQNZVpRL3IaoVgeMOL
	0WzBqkd9NbpaIYW2u+cCoI4zN9ZNN58J+a+pKHaOu3PFJsal6lv1WBnF3tmMKS/xv5GWGRDLtMv
	Vbm29x3f+EyJF44FoHQh4UxK4narEVeZuXBhJr7hdaADvzHrs9sJPu+quXkqgokjqcL0u7x3iZn
	NCpC17jcIQWsz/beIe4wRf4fg3Z0w2JgpVzWQT4ELJvZ7RF+7+EpDCejfx5fCf+hmPwQxn1Feix
	drkfhqq62o7T4WHedoNgF5Gry1CVZznHoAGlJYsT2LKg2XbWWROZWFu/LCa1QY4brgFiAsCmDYV
	WYwh+/p7FofRHnwN6qYojoLgKI9Xd4uWjAJ49j91mYTov7TZmLhpE++jZlwOGNNg+kxsgMJzV56
	mPm7l+v8zHztpHljkbtom6+CWrTTKCU=
X-Received: by 2002:a17:903:1a2b:b0:2a9:6414:719c with SMTP id d9443c01a7336-2ad74463c78mr70338135ad.16.1771845471195;
        Mon, 23 Feb 2026 03:17:51 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:17:50 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:36 +0800
Subject: [PATCH v5 4/8] ARM: dts: aspeed: yosemite5: Add IPMB node for OCP
 debug card
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-yv5_revise_dts-v5-4-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
In-Reply-To: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=881;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=av+7nUIzNcRonWagw3z99/fjVjTYsiFRkATkeneAA4s=;
 b=Ws5ihelxDVqIQUxXO7hw5CQ8FFbcVwALjS3z506cbC48qdvhgLgy/1do0c8xHzKjvqTLQPwIa
 6QORwth6PbQBSujcIM/QV5/IyS/+WnHx6oDBUJmTR5cy5cxV0So2jxG
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-3545-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[kevintungopenbmc@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amithash@meta.com,m:Kevin.Tung@quantatw.com,m:Ken.Chen@quantatw.com,m:Leo-Yang@quantatw.com,m:Jackson.Liu@quantatw.com,m:Daniel-Hsu@quantatw.com,m:kevin.tung.openbmc@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:kevintungopenbmc@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevintungopenbmc@gmail.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,meta.com,quantatw.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.10:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,0.0.0.3:email]
X-Rspamd-Queue-Id: C47EF17ED52
X-Rspamd-Action: no action

Add the device tree node to enable the IPMB interface used by
the OCP debug card.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 983aebc394d9159c7e3db2e7c39e963f7b64c855..84d3731b17f7c7c87338672bbcc859de2b89b722 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -365,7 +365,14 @@ i2c6mux0ch3: i2c@3 {
 
 /* SCM CPLD I2C */
 &i2c7 {
+	multi-master;
 	status = "okay";
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c8 {

-- 
2.53.0


