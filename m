Return-Path: <linux-aspeed+bounces-4082-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJx6NlWmC2ozKgUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4082-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 01:52:53 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A4C5753B0
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 01:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2Q6MsLz3brT;
	Tue, 19 May 2026 09:51:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779092023;
	cv=none; b=LbL6u5q1LaIDDCVZjkluqTMlvLuLfgDwz8Pz4S87sS+XspTYMWrs/XuLRCyFzqW3ZdbhPYNuWNiWmTwW4xXbHfK8iGBAKApIh8XJDRX/Td3EUKnB7qKGkt5Arq6+oM/6MRLc5WzsGEhA++S8ebJd2M9bRM6me+BF9pgG8FLCng63NV5KbCwpMLaq2nJXlbQZnRignq3ZYJaI+AadOprFtelEenhkpcNWll6Dq082sRccaCyekuXeMao7pWxHFtIkq59agwan3QxLB5Tesr6snhLz6CD4r8DcOe7ONKmi3cN2mJ0iU4mE3MrKCtvGhawzn/+xCrMnfud28URkLDErfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779092023; c=relaxed/relaxed;
	bh=TtmjcFudJHdbwgaOw1dq0xgX0ESp0DVFqApr/5XXiuc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YL32fQxc8JHpj4g5/U8j7mLBWpqBb6h0DY27N7vnp7715HYFrxf9CntdmT03ULRSjinRqOiK/yk57fKqitLjVPSqf+AAG5qeX3rukrJ+Qm+Is8t2rcgrS9ycXGQqQUO2INQ/Da40QPbE1UCrf50dJGbssuIqjrBbK85dhe/+CmDIVcr7xaezjPyvtiaLkbVDf8kT4uTNDPuukWs8KlVQ/YoYFyjAr+BXWpoOP4/RTrsBzLJvcMo6Dy4MhkFnv8NerNFGDfGGXA6wrxBkAkumltTBiWWorqh9WPtpBu4QFKXJjUxZzW8GRRY0EczVITB+L/5pIoJexLtJj42EtOrSCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hEyvskIT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=neilcheng0417@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hEyvskIT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=neilcheng0417@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJrD6512yz3bqs
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 18:13:42 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c70c112cb61so1599726a12.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 01:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779092020; x=1779696820; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtmjcFudJHdbwgaOw1dq0xgX0ESp0DVFqApr/5XXiuc=;
        b=hEyvskITLaeJO1/0/ZEBW12om5RGIkvF1WYo/zHkhC5n60Tknefiq3jzyyUlMAT2IF
         coMlBZLcj6kc2RG7qBSA5CXFjsSY2vaW9gleQlUIlHfP5i7AtE93gp2e4JBGdpiQiYs6
         40c7FisD5tP5+zyYwtMH/tef2GieYZ9DxX8urX6h2ZEdbhcTGE9+z/4zF6A0gt8IplL2
         p4JUptiSQU6fRmQfzF2ENehzUUYTzs9ncjRwS/zPw++tYVxeaEWzFlhU17ws2Gv0OgdO
         LWly4irjbGxR7YXErbw2llOgJBandk4z268YNFkV6MiwTqeiFJ6nuTGPK0hMWQipG537
         nNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092020; x=1779696820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtmjcFudJHdbwgaOw1dq0xgX0ESp0DVFqApr/5XXiuc=;
        b=V4OsN+fGt2lK5G2pha3YMit+SMru0DVqVAhVfVmNha67amtZMXYT5XfSl2uB8QyEW/
         Drof9Z4WPe42f4nkL750cCr6Wuc5ctOfqXF0S9MxlCmgXbGAeyAmrtH5CrNpdDKwWr3V
         QTFMI7creJ/EHTBb5Xxt7z0Fu86RajGp5Vj3aarvdFq2iBGy/b8QifI5V2wjHLXMwjLX
         fyepG1c5Ws1DPe7W5YfZ72i+cXmLlcWrmWIdw5vZFyMfpR5bpQ6n5+HvXTRfM9UGml6d
         IyMHFnh1Civq8TGP/NQEdAu6f4U+RMzPaA6wmQheyBXIaCxF2KTaeYA7vGLNek1lMsU4
         voew==
X-Forwarded-Encrypted: i=1; AFNElJ94z5QyaAAxB8F5ZcPuMl4k8cRAGzIcTrIeVoO+Mcide5u0NQH5l4NG5YEh99nycaAUeRME+vEhlMSNIRQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTW5ct4+zFVmbM3UlwdjsS51htcSAPAFjtj3N+xvgSNr6WC0cg
	+siOJGO4g1c5epvnylU7t4/W4VZQDcudHAfLTiroyOogKP9Jvb3+cqDS
X-Gm-Gg: Acq92OGuQl5lCbZ9puN13jBm5SQS8wKGveIIm9Qk+/ciA7HMYV9XZyUkSB9r5KT0CfU
	RgUlt0THXNoSkCGJJbvtRmCLLcAXPT2czQJpfXwkm8F8LGQadv9DyDYCb9VVf5FC8qeJYbf6YwA
	YgDYHdtfa32zCxCtqK7nQSOtOPwU6KMvjj7nFkkDqxSqFp924XSJql3Bm22npotBXHRNDekFRoA
	Rrl5dNwZBZhlyoisqiksXmiOb/4bcSB073W3aOIQIV9GccMaanqkQcMXLtj2YMuVyebm2DxHZ9g
	e6qGM9HrCuQJkkBpjUoISMg6T9+8XrZXFyPTy5XKrLqM032U9VdNVB0L56xJCzHxFjFR/01UeKC
	4dbbjOiYguJe/fkIxoSrnKUIqJ2EFXuXrHC2aJAPUBcuTjZFLiseUWUE9rr+JcT4pkOnlyJ3Drw
	cw0J098Gl+mkMd0Fh50Jt1e8Aki2i/QVFAmspbJ8yc0jJXRwlwKQVdK1BcP4K56NS/Yh8tMw80v
	Z70SX9P5qIfEEfcknwL7Mb3
X-Received: by 2002:a05:6a20:7294:b0:398:9d5f:e093 with SMTP id adf61e73a8af0-3b22e75954bmr15671941637.19.1779092019769;
        Mon, 18 May 2026 01:13:39 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb100706sm12749462a12.17.2026.05.18.01.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:13:39 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>
Subject: [PATCH 0/2] Add Meta Rainiera6 BMC support
Date: Mon, 18 May 2026 16:13:23 +0800
Message-Id: <cover.1779088499.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:neilcheng0417@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,codeconstruct.com.au,glider.be,gmail.com];
	FORGED_SENDER(0.00)[neilcheng0417@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-4082-lists,linux-aspeed=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilcheng0417@gmail.com,linux-aspeed@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 54A4C5753B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Meta Rainiera6 platform.

This series adds:
- Meta Rainiera6 compatible entry
- Rainiera6 BMC DTS

The DTS has been validated with:
- make dtbs
- make dt_binding_check
- make CHECK_DTBS=y

Neil Cheng (2):
  dt-bindings: arm: aspeed: Add Meta Rainiera6 board
  ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-rainiera6.dts  | 1012 +++++++++++++++++
 3 files changed, 1014 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts

-- 
2.25.1


