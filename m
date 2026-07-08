Return-Path: <linux-aspeed+bounces-4441-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pfctM4fbTmpHVgIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4441-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Jul 2026 01:21:43 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2CE72B1AF
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Jul 2026 01:21:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=9elements.com header.s=google header.b=WmQLoJTR;
	dmarc=pass (policy=quarantine) header.from=9elements.com;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4441-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4441-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwYyD5p1Tz2yfD;
	Thu, 09 Jul 2026 09:21:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783525129;
	cv=none; b=cqqMYe8lPrloqZo8PS67SIWo2NiU5jER68apwmTszIp6YPCnSF127ftS/PJS1rlDAL2mMHpx7z8t0xqdqyNPKhDwS+bAMnfN8X7Bh2BBMzzGonbBt935QsMl96tyLKvTs1We3n9oul4l5+JHtS61prJEWXyEAsyK+bAZYfm/TuY0BYrz/prvwxJ9KmnOCcVcfY72VJcrHW4mW2NbnBgL8cOIa7B9HzMaGpaD6j+YknqxKLY4FG3jOkx8994M7zafSJ9INq3RkwgZh0jSSUk2ETTs9p31S0mMqSjIIW+AYNeJuHHRo39Zqo1vaEVejCrnDrFAZdtIJXev7cRGtzLF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783525129; c=relaxed/relaxed;
	bh=NnLAnFwCqMFlG/o/7EF1TFc96QCA+EgXe00U5MXSsXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEtlVUzoo9jVcXDDVh+4jobK7tYcqN5t1/vDe3AJYgIcpAsVCqapGrOklaUCOjguolA6hmx8WtjKqantV/5NeNKcIaSAcdxK8SdpvmSwPg2fcJZk0nix9WQzPDQpNXIv5dt6SRTPZ8ujMZqP7C7qF7OC7pi72HFAl0DYoqncF/RGAbHadmqf8PqBW05+gMgg14P1lwWCqKgIRQ5NlxDcS3vyld4giTDgIRVTleNolUGS5G1b579caG7JrvtU0wFaQNuOmF2oc+USOtbpBufBjMYHf0d2Tlkjg49+/ozACD7QSOfDRtMoD32D/v5dDEp4F750D5YUPlvZfTpHm8BCyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=WmQLoJTR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=gregoire.layet@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwMh82TsKz2xWY
	for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jul 2026 01:38:48 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-46ed4f66256so742388f8f.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Jul 2026 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525125; x=1784129925; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NnLAnFwCqMFlG/o/7EF1TFc96QCA+EgXe00U5MXSsXk=;
        b=WmQLoJTRIVTSNfrbVdKImOgUEgGnXDcYsgqJWdMpXAuFHreBMu4YahwjIroCpWNr/6
         +bd0Qp1Qr2zbfhFv/PRpIL4dYtvYDe8L+i+6ywpmGcDOHxf9nO1reDBdTcpTrf769kRl
         mGX1HaoiMJ0AorYBf/ykKCeUQKbv3CGkpRM2Znv2G2gIykYa6kJRH1hUFliWgfgxrhyw
         4HteC6+jzKxlcZjcGn3xL4RDcImHiyYTEVFod8K0P835DPapHhUeb6GXHS95A/kHtxfG
         uX1zcc3ztt8DtYzZY8XbG2m1v5kjudxKpsvsCc8gvQvkf5pJaWd7AlCnzWoEjifWS99b
         APcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525125; x=1784129925;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnLAnFwCqMFlG/o/7EF1TFc96QCA+EgXe00U5MXSsXk=;
        b=gZME2daeF+ThIKsRc0B5rulpHdILAWzBK68YbyOrzy4s0hCAwS7KpYRWf3Pag+oovV
         WWTHXpzctx2iXnmCJ3z4AJvz93G60pZBUW0Ns/dwGYxiV0nolSk1n6oTxvN3KJt8MfJJ
         RK431sndvtUBo35hjCfelZx+eYI5TicD9WV7Q67BLbn6F1xlquUFCFewoFFGZxGtugkr
         e2WgB5ehg50tWVg1wrBPYy7MWU547BNGeo6JcD3FN/IVROnb05/YdHEMZYPF+eJ64yuh
         UiT/HDTLIyOE+mTryOs/uVVjQ1istKTd7cv9Y3VNoDznMhwUPgXr6Ed0QYbSEXtJwqM2
         pLVw==
X-Forwarded-Encrypted: i=1; AHgh+Rog0GQZfmBBOzvYEk3QJJIN3g6M50L7hRi3kwWcgyYloH1D6fmzIZz5Rv2vupAa+col8piPnebkTb4NjLw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxu2CG9CnDBdvGx211SoLCpL6Adxytb7U3VjQ66AUToDIQygxY4
	ndxp7XwRhdWK0LFoll8p1okUriB+9IC6G6Pz1o8oNmg7OxOedfdCpggEhpxvecH2f8s=
X-Gm-Gg: AfdE7cmYLjFUZKCmy/s/UX4tTTgBSaqxBLT7sYGBzPki/YfwbKU+RLHYivbkFOg6eO7
	fiiiQBUA6d+lTto3Ch9o/kf7TmOD0Anai7k6sOnpOyUCEp8JFLrCEmHdl1fM62z2FzOKtcbgsCc
	BT18kMXq1qQPb3mGkUGsygZuGKQtoIa6aakE9GSImxASpuSZgoB2c+Maydj72jawcO7r8tSyVQJ
	sdCMMq65sd/IZbjbutPLgKDm1Zr/TNeimFn7iFvwJIPVJLi+iZ3NvFASEGKNGqlgVTUitX3AAu8
	StS6SWPpSzqGMZFKHKYbpHbKRJaaBwYIf/qN7bwV7XGVIbGVn1rpNUx54kuwkb+SftrFswmqAsQ
	yLbxg2PzoWFneZoYsXSKFVvasCprFZa85PKNhoj1M7lBZ6C09E6DVuOybTs1fhY/xGY1exJmmpi
	0KakOimQC/GCJDhlDaQ4dNhIHXk+cG3h3eJm0zlSJYXAyc88dLQsrsu+dZQRpRJA2uE0QwVBzyE
	76sXxH63eVgxfGgHzGIL1xRIMriNU1u3p44UsQ=
X-Received: by 2002:a05:6000:220c:b0:470:3edf:e28e with SMTP id ffacd0b85a97d-47df074e230mr4140001f8f.10.1783525125665;
        Wed, 08 Jul 2026 08:38:45 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:45 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v4 7/7] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4
Date: Wed,  8 Jul 2026 15:35:59 +0000
Message-ID: <39091b1d0c716da3502a691d0a0bdb7621693cf5.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4441-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:gregoire.layet@9elements.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,9elements.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9elements.com:from_mime,9elements.com:email,9elements.com:mid,9elements.com:dkim,lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF2CE72B1AF

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the syscon phandle.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7c02633f2bd6..2b51749300f8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
@@ -742,7 +744,9 @@ vuart4: serial@1e788800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
-- 
2.54.0


