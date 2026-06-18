Return-Path: <linux-aspeed+bounces-4274-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1th/FCZ/NGqcZgYAu9opvQ
	(envelope-from <linux-aspeed+bounces-4274-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jun 2026 01:28:38 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B31216A3142
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jun 2026 01:28:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=euUqukeP;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4274-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4274-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ghH3R2ncLz2yrX;
	Fri, 19 Jun 2026 09:28:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781768451;
	cv=none; b=kNuwCh7bQp6X9Z8G5tynkBTMn7JnaO5DIFLXE8qvdRbiVMKTRFxa5Zp9QCJfVtzNqM42ExPTug0EV5h/cpjMzzuA653lTiPG90wQuwneZRuLq0HO4M7ITrZqlfI4VXFBheY5bebRSrOKh1gGl8wuaNLJVdYFsyqne1gPK6BcHlf9eNprbTj53eSIyXSN/WZVOxV6Y961jHKZ/pwhFZD/42eNLG9B+VfU6QZ1ETiHgM8aRVgJbxFMkxC0k6Z9ym1oOwX/F+CverXtlE6VlRfQWMdYMNVB3jW5QEVatAfc4XQzV4WxZhAD+xubINuLXXWl9li0TmzlkKPFHoI0aWXjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781768451; c=relaxed/relaxed;
	bh=4bQGAYRRaV2+W1903QsWxmruXddrxMYSZxLh/ZQ661U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FiS6rvVwN89lpFVTtEp3tH0j5qFXgws2LCQU71JBHn2+nzDd+iF/0kLSRZWlT97exQT1uPQphEsXJ2wJX3csCuaxm8c0+C+Eo4/C+a3aOfPxZS/ivDB0i0AcLZtNH1FU2w3h+qB4TDVbOjnOXprj/1bATdAoIDGjBY92zKlrhYmKdwtr6UDBQsac5twQNDJHIkmXPD+wfqQzl9HxSneltThu9wVpsV25AOKR3WkarqNoBmrhwZbsveXXyvCq9pT1/CqYrT/v5r31S4OnRtDpBsOu31algs9y/vOCzrDJAmYFRa3k4ZwwG6AbgAAnR4qud8dtuDSrt3UViJ7xzJL3VQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euUqukeP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=mike.quanta.115@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ggt1t1CLVz2xC3
	for <linux-aspeed@lists.ozlabs.org>; Thu, 18 Jun 2026 17:40:49 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c6bb8a5980so4477715ad.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 18 Jun 2026 00:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781768447; x=1782373247; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bQGAYRRaV2+W1903QsWxmruXddrxMYSZxLh/ZQ661U=;
        b=euUqukePeLwnvgWAP+6xPb6FPn3WQvPoe28+7EUlsxVcsbTgCYIzb9dyNMk1NTVErn
         W+6yTgQEzXFy1RhACNLa++ShurpmgvH8+cjnYX+3OPK62OzWnEJTmhSag60kWxNIoP9B
         Z5wfs/no2LrQTMNLLKJFut0shmyq0RBNWA+ajFTyefKnea/lQW0mmzcyYPNjwAAI8GaV
         6AYQ1nifoQ3o8FZK49PDJlGXP9ENk7AvU3GWFcJC2J9R111qwgLqvmd9uMhMj0r9EvT5
         If1poCTWsTLnPxWXZIcMANLfvLFp+QO+b+xNIslWoQG7vW3ZxMaF5MZhe0YBlCP6LXzi
         N61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781768447; x=1782373247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bQGAYRRaV2+W1903QsWxmruXddrxMYSZxLh/ZQ661U=;
        b=hiP9dh8Xj7jq6vj8vFGaiuYZ31egf6shblNBKD10/3vLnyW54KQuK3xHvID2JQ62GM
         QgqQ6X0qvgzeVVO46k2/B0cnpBcsLDrlLNHm3w9JwAXIto/BpmZGnPP1dQ6T5ze09n3O
         Tanp2JlNc6GTc7z0Kc5x+1eM3A+BWBl8cJuSqMruLqC6gcRYB8ysJjLlO4Vxvo7S5huH
         akJa9+gZEjNUxoGa5eT+JjjJkffc5nfgktktLxp1fRvkdFDehbTf/ka4fJj972ZJi/Tb
         G1Lewgq+IxjjmcwFxzo/llFZaKve4E0nJp97KBWnL9V4ewZro63+BCzWti47bgYK2AdL
         bqXw==
X-Forwarded-Encrypted: i=1; AFNElJ+eQ4PtN34mttDSKwmL8hdQmhR1nVeCyIbM9Md0JlDcYwStMRhkJdCQBzsu4bnT4hWZtCRN996kCXcVxUg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8y0rg/uwf6649XLxnxIz8n90AuPGT+4CnZbuDSLWfDX7l2Q+t
	N21uckikmQ/10jSg/c11DbTLKdF+q45Pp91RPGscWEoMlgETwDtwE3CZCY3jCg==
X-Gm-Gg: AfdE7cm/fhovVUCmNC73Ox05bW7DGvBuOTdnG8JTBUP2F8X3nJ5W9OHC+VrUEkiRRd6
	WAh7i2WacU1bM5z3T1optbQlzaGrVJU/hbWIt+Jm1yZNSRI//BqYb9DaWzgE66wPJV7mDqjOelo
	wcjCK+Bfdvv2VCXMjC/J2hAwsYWBEAl3gBCZt+bkdBGZXdtXsCpvoUd6iN+KyznJbpMzneeiYF8
	v3TVnkZ0w0otXZbgsY5nw0/SdWwIQhUpuPEuTGPmJ1ljRa1fnR4HVj8rWes0VYffIRBEMQz1koj
	bvjGCz7dXQ60PC1/vfHBVA3FFEmc8v8Y+qSAvKycD4YsI8gnVPJy2olHNIziVu05y5IWCIqekw7
	2Otsp23bd4xGYS6QaRtiLX+UmIbhj5H/M7p4JUs4MbLU/eKROKp34A3VJiQvXKSlSoVTSgR2OLp
	qxEIhUqPDs2QCiYAj1yPYiTymiqXi+fFTMOrR2/JpFg9YkcaKsqi+X6mdl
X-Received: by 2002:a17:902:ce09:b0:2c1:f29a:b554 with SMTP id d9443c01a7336-2c6e5276358mr27029345ad.21.1781768447233;
        Thu, 18 Jun 2026 00:40:47 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac80asm170465445ad.39.2026.06.18.00.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:40:46 -0700 (PDT)
From: Mike Hsieh <mike.quanta.115@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: sanmiguel: configure LM5066i HSCs
 for PDB
Date: Thu, 18 Jun 2026 15:41:43 +0800
Message-Id: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBBA0avIrB2YxDYtXkW60DiJAxolY0UQ7
 97Q5dv8f4FyFlZoqwsyH6KypgJTV+CnPkVGGYvBknXkzBu1T4vEL8847op+TUEiTupxXp7knOC
 LwoPYDI23DCWzZQ5y/hfd575/UlJw3nIAAAA=
X-Change-ID: 20260618-sanmiguel-dts-config-hsc-lm5066i-70f40e1b3c2e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mik Lin <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mike Hsieh <mike.quanta.115@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781768507; l=715;
 i=mike.quanta.115@gmail.com; s=20260522; h=from:subject:message-id;
 bh=6zTiz3w7GY/mvuRAIGS25k8loWak+uMbX/Tb1hT6QIw=;
 b=R8LnW7P5uTR3hdw1TZeBW8HSvfQD7fYHI9xc1necYSMYzKw9jzZdiu94yh4PMMYgeAVq/vigV
 vFPAg9cKrhjCTvvTTCFFjDEgtIjsqVID5CvUPSzpINlUFc7KvOFHrLK
X-Developer-Key: i=mike.quanta.115@gmail.com; a=ed25519;
 pk=DRIErV0xX0KMBlR/irAsbuN4L3egitHbC8FHruUH4HE=
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4274-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mikequanta115@gmail.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:patrick@stwcx.xyz,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:potin.lai@quantatw.com,m:mik.lin@quantatw.com,m:Mike_Hsieh@quantatw.com,m:mike.quanta.115@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:mikequanta115@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,quantatw.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikequanta115@gmail.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B31216A3142

This patch series updates the device tree configurations for
the four TI LM5066i hot-swap controllers (HSCs) on the Power
Distribution Board (PDB) for the sanmiguel platform.

Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
---
Mike Hsieh (2):
      ARM: dts: aspeed: sanmiguel: fix PDB HSC shunt resistor
      ARM: dts: aspeed: sanmiguel: add current-range property for PDB HSC

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
---
base-commit: 57596c043ad59cf2e53fadebf6d1b418190e3a49
change-id: 20260618-sanmiguel-dts-config-hsc-lm5066i-70f40e1b3c2e

Best regards,
-- 
Mike Hsieh <mike.quanta.115@gmail.com>


