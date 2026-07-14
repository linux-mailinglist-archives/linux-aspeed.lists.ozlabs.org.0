Return-Path: <linux-aspeed+bounces-4475-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FkgFDZ6FVmpt8AAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4475-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Jul 2026 20:53:18 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315D757F7C
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Jul 2026 20:53:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=9elements.com header.s=google header.b=ExzljdXr;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4475-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4475-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=9elements.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h07jk1nJ3z2xyj;
	Wed, 15 Jul 2026 04:53:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784055194;
	cv=none; b=mrnhrqBnFJYHKq6heXmaAAnJj26i2eyfp99A3CQg+WJQ+HNymSKX9sY1vLqhwaUhxRphyueG/iYvuC2KYK7qwBOmMuZIdpsdcO/V8yE3ZA/dVMOHS1nm9bdowiUAnvsO75hzToDr62kdGLAKf2+U9VYV+FNaK8VnOsf+4lF2B/YqTLeEXHsiarKg96wwREdCTiYuUN8nZX0QoD9DV0JvFSsT96lfK+TV8lgVI8AfTQk/BsXhk92So4+aoF4KSj6oMq5cWMzGZH4Pd0Jj6NG8h9vayuIBCF6IvZ6VTS/N/bR8RXmbj65XZhUW63iVT5NAH5b09cyOW5tAgWzy5VY8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784055194; c=relaxed/relaxed;
	bh=oeiC8iwmB/ylmI7BL0w8nOLqlIUesF4NQaKuVPlJTmQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=iUm3q5owED1g48Ywp3Wcn8g5P0UN3S9NEeJkGYZ7VKbEZiC3c3YjBBqyHmU8OlqPc4uQ+Haypu11ThXAUR4znUqsi5beph0r1tEP5r+ahTrE08QR/2STmID/bksFEmgrK15pSoxiSc0xDRWdzj/FcnPNrSgwI5Qrida8HqDQIeZ3FcQUN1LAzCeHz+3VM7N2QUFu7KkWVdg/HKg3pFKChM/SmF5/QlM8MMwe8zXW+XobmhBLhDy5VDJ8r4kMCcMNl9+UQaQQh0OeqcggFs/1VaeLqh7hTdQBlUltTQucl9QTrWSofhfwIAul8x3XOHjcmlWQIVr7s3dlTRY5uEt6Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=ExzljdXr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h07jj1pcwz2yN8
	for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Jul 2026 04:53:13 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493f75f7172so30905195e9.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Jul 2026 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784055190; x=1784659990; darn=lists.ozlabs.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oeiC8iwmB/ylmI7BL0w8nOLqlIUesF4NQaKuVPlJTmQ=;
        b=ExzljdXr9jtFFobtBAcp6yb28YbJklm5a+ymEkpTTGlLL1CIT3ONb0paLpaNvikSOd
         P3VesZ4wE2/H18QY6Cq3gxwcxNAPX/kSSerpkHaUW3HVnnv8TJzrNi6V8OW4l45nqXYC
         JlaGpCQ+UrEoMpnSAvyMLrov91pfSnaROo5EpmfSpDXYubwMKc+ov1vGWrdU49k7Qf2L
         3r7D2pbm/tltP73zvYjqWq8mYKJU+l+Lx8dTTveAdhWelrOghdn1zaGaMWTIacX/tb/W
         XqTtciDcdvY0+jNNKT4UKOgrTFIIf8lkhJrbGnVaR2aXyzip1PDLiy0ZASa3K9okEw+p
         QhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055190; x=1784659990;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeiC8iwmB/ylmI7BL0w8nOLqlIUesF4NQaKuVPlJTmQ=;
        b=VWLdYbkcMnMCm/KWobK/BK1VNKrHq3ThyLVr53vkvD/zCp4f+D9aLo0pBxU9lD+Q28
         L16nom0OteIMMey+FQyOjIZvFQhLx6SPAlDpuxGT3R2/kTlSk9mVeXYuQ5+Qbd7yovnm
         tN2z1DvhbzNmxhBp6W+bpxPzBbJOxumxjtceGIi1afusAkxfjogye9t3CYhF4oGaw1QW
         MSGtu/e2/LfFO+2kqV2pvH6ZNoFRJoJI+zwc6N3VHZmJg6cOqmymim4htF06jJp7FMsN
         d8ft7ubBcyu94C3ueid8kFDqegSpbmLQF5NwM+hE/FYrUytEVTTvrje0VGAAuOCMAYjD
         ad3g==
X-Forwarded-Encrypted: i=1; AHgh+RohhLur+jTU5KU/bgdMFwb/lhDPaDCr9S+VOXLCKrrZ7YBmJCxxbyuV2I23yn3ecgfxbt2YjB+DnCpYuGM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8naRhp7609jonanlFhd8UOFbRKmWo0WZOKSa7ODIv6IbeSe9Q
	LvNGwi0pHSugrvL0DZaH3d0UISfJipVppwQSb1Khp62u48hMk0JBtDzuGXcfaPZAJOo=
X-Gm-Gg: AfdE7cmBWseEYcuK9WqWZMRzo1X7eVD2g6nsYdp8RtBRvje7042etsj1nPnXWEmxK1V
	URLqYdqdjeQnxMK1jo5XDJn0gZtj7rWExncwc9Nl0xyOZFjb6B4NNzMEX6gLQUB06U5lZlXj1K0
	hnkafP/WaZDxxwwUkx8sTVP6B7tRmKsn8uYTRt3VKchyfV5A6anQl8bD86rB090xBhL/6Qzi69n
	8U5Y/AsaCXKjEj91u7FV6O4/+owDbu1aOVxqai9pv7g5M2s7uywpuVlzDPyAZNxzhPw4VQi4LpA
	l6TUngWlJ27qcN+oJ6EKSwBkelFzjngNq/jxNej4Xty/E0dA5q7JsJb8x85Zp9fJaP8iNKWcduW
	CFtfA9ojjDiI+lQ3wa0BKx83Bj6oo0fcDOs1x55O/hIPEJ1nWqhWm75nvuVh7OM0XhdQ2zbWJTb
	aiDLKgJXiDs+271O5XQSGVz3mKvSkKrA==
X-Received: by 2002:a05:600c:6048:b0:493:e404:3727 with SMTP id 5b1f17b1804b1-4953c27b338mr384505e9.23.1784055190102;
        Tue, 14 Jul 2026 11:53:10 -0700 (PDT)
Received: from [192.168.254.124] ([2001:9e8:2fb:8201:c26a:83ef:161a:409b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508725c0bsm94908715e9.2.2026.07.14.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:53:09 -0700 (PDT)
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 6/7] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <5875623c1b20cf5a1abc980eab4c31a47cc58468.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <5875623c1b20cf5a1abc980eab4c31a47cc58468.1783524645.git.gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 20:53:03 +0200
Message-Id: <178405518338.194693.4399160180155776340.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055186; l=799;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=cSCbnH1xPXdFvXoeIkjlw6q74tyyx6jthYZF2YqxS6Q=;
 b=mkm+x2rfwdRTX6T+kPimO0xGU4ZCOBNQdoZdkNzfY3dX6Gjkg11WJUNKDAuKCKrynIBxtwo9X
 8eCoafR4SqRDuGXcQsnzwqL52BuI0qAQ9N5syq7ajzX3e5IrjjdojFC
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregoire.layet@9elements.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tan.siewert@9elements.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-4475-lists,linux-aspeed=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tan.siewert@9elements.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[jms.id.au,codeconstruct.com.au,v3.sk,vger.kernel.org,linuxfoundation.org,kernel.org,lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,lists.ozlabs.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9315D757F7C

> Use the ast2600 compatible string.
> Make it more precise and enable specific ast2600 properties.
> Still use the ast2500 compatible string as a fallback.
> 
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7..7c02633f2bd6 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
>  			};
>  
>  			vuart1: serial@1e787000 {
> -				compatible = "aspeed,ast2500-vuart";
> +				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";

compatible = "aspeed,ast2500-vuart", "aspeed,ast2600-vuart";

	Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

