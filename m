Return-Path: <linux-aspeed+bounces-4102-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC7HFfPHDGrAlwUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4102-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 22:28:35 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8710F584B23
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 22:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKmTX3Z29z2yCM;
	Wed, 20 May 2026 06:28:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779158329;
	cv=none; b=jT5R81xmf9qDzgwocuF1708gqJg2pQE0p4H86xXBiNuNv4S9VKLIg+MNtOljN6z9IXf9lfP/rkbTeawmZroN+kwm33vmWF/SxpJVoIE91Lhnz56fD1TsMa8d/+R1QvWZU0cIVGIwWuNmCM+XFROtFrqJ0Ve7aFGs8Hbfkt/FiL8JdjmUPMOxoqUtG0a8h6JqTviGP+68mM7jCVzzcJbNw4qWCN+x0JWezisdKy8zYleWckkAlmOShcv23BUjfwXvvWptHfn3fTrD4XA5rzp/7tFYT+4Awtkks18lOdvF9cEasKuhg+OfSz/4Cf9rve//4a86V7jbSC8JSYmE4Rqqog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779158329; c=relaxed/relaxed;
	bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P3gISu/oN3vN6PZVSooIAwpn1grMuPuXZOjMRzqtEaRRkio7Ek16vC/q27lLeQyY3J57AUZ5wRfjTpS4Ro2nEi3tHNjYi78XVfJm/Hpw7r9L/879ZX6F1jY8/dpz+MqF9E8yxZkBZ3jMiOiGRHlU0/Ar6dPyd/MmmHmnuE4K4FgEBYW+ENVL9JH1hnNR3eCo2QtXUf+wELtgO0BiRf72/7m+Z/4xdSwUcKQ4rWH17XqRn3wL8n7cB5fnyBEqZXGPJCET9TbyMDmcI02QDrKf3Olw9cxJjlBUQuT7TZNiS06SiBNUErPvKFMxyxNfDuTPsDTkDG4O7iiSFWdF/70vAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f7Fn4kpY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=neilcheng0417@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f7Fn4kpY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=neilcheng0417@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKJlD3kYsz2xwH
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 May 2026 12:38:48 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso1389604a91.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 19:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779158326; x=1779763126; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=;
        b=f7Fn4kpYXXviIv93NbZS3H3svtrwtc7MF0zbgujDAkGp6aJmq4Yf7B8cY7Qhdm0J1y
         YFDEUudipI1ftAEEk2r/15pKOW/Sa3su/pi9NQv1T+g3HKGojLZ0+93RO9vXMZIHDyxG
         XZBzyq7DxJA2BXXyXrFzBeHdUNetBTThBrqEsH1uX3ssoIlSovv0/AyMASbl7ndoyCTH
         NLBbwQP+viYsnUGtW6Ijx71iWSM5oU6q/qalOhd9IqdnAkkuXl1YOTy25A3pSIa3axL4
         Cgsptf7BDR6sUm/kY3vrhi1Cqa9jyk9SkxvgiYc1C3QZaGs1YAntj6ZPcsUrqfCcbUYH
         l9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779158326; x=1779763126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=;
        b=f3IFWytHq4mirtThW7ETiaswMSSS9VFMpDgElyapxVc/PUPp1EFJ1BiPMVSRkiAQZE
         OT6NmhLtxTveFEiBRX93E8iBVuZeEjab/pNY0dGs1bdRXc7qibiqQExLww130J79YMer
         TW3UXBHI7UonB/0AC+sC6VB4ybYrCLk1egfTH+6vANJAdnZe6lNG3j/n3AK0ePkGg9sn
         LfswzQt4Dr3y7OTqyWZFqSXeM+t8KiJ60+P8LOFJJil88o/b404tIUuW0xVudHtY+5Gc
         TlqqDRT/hBYEAGGf667aXlsNnZpq4esZfha6elkQjgyGRQEyVZczDyDn6zF07sj4SLNp
         FrmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AsD4Mma1LnhEhwidf2bwUeM8Q5YOyDP27ia0d5VqiJ5DWvp2JODxv3Rv8Llq1Pj9Br+dpnfH3FR2d4yM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx9L7F2D/ECguSW0PhjXHT1rQ/zncNR3FErUmAnqg8piI8pRLmt
	uNWd8xN9NwuiD8s9TzfKBSkPqh3Ehe4sSA4pz9AG0WCIBqDdtBSfBjXI
X-Gm-Gg: Acq92OGbCdgYmdJVXPVeOJNblYbN/xk9hB/PSvaP1z/tAEMOPtWlD2HUwo9QITd/8fi
	WWZFAHVjLvyaDEECKGEgpSSspoMnKerp51MaB+bKc6t+44ybsO+cASbQRfo1IKnDPya/C6/AhHt
	a0JGPin5etOArn2RADq5iTptpdCGJNHevQpxiDEERaoe9r0nPS9GhWOHZbfHESkMs0T+qQAh7Se
	+BuQ5oEc3XVT3mZLdqZs+gvvwSEyhNS6qWyPYmUu3yLVWMmjMWXrvEbDZi89YlQKFMLIZPwdnhA
	8RZQDBAAf1F1KsiRF/lwmWCcujSfP+dFQq5wq4UNAgzL9xnZsvJ7IxrtF7Pjn3JgF1CowKDZXpW
	w+4hACjAkgZeKi5I+ymKthB5LQOkoxlxHezrQcYqiEmpmrygu0bjRQYlDZw1uTD68qmvfqAxpHP
	4Brori5HGaQpK41oXhEN+9viihNlpVVz0EKktLNHGU44HKilqfGlkMEv7Df7bqUT/Esktd+IpUv
	mlEfJujhowF/A==
X-Received: by 2002:a17:90a:e710:b0:369:ee20:f5e5 with SMTP id 98e67ed59e1d1-369ee20fe62mr3060296a91.2.1779158326394;
        Mon, 18 May 2026 19:38:46 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695124601asm12407713a91.2.2026.05.18.19.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:38:45 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add Meta Rainiera6 BMC support
Date: Tue, 19 May 2026 10:38:36 +0800
Message-Id: <cover.1779157117.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779088499.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
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
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:neilcheng0417@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,codeconstruct.com.au,glider.be,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neilcheng0417@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4102-lists,linux-aspeed=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[neilcheng0417@gmail.com,linux-aspeed@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 8710F584B23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Meta Rainiera6 platform.

Changes in v2:

- reorder adc0/adc1 properties
- add Acked-by from Conor Dooley

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


