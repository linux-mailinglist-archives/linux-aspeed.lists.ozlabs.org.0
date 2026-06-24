Return-Path: <linux-aspeed+bounces-4302-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PcHhDZVrPGp+nwgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4302-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jun 2026 01:43:17 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F57E6C1E74
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jun 2026 01:43:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=9elements.com header.s=google header.b=JPg+LsFR;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4302-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4302-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=9elements.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=2")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glz5R4KSnz2yVv;
	Thu, 25 Jun 2026 09:43:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782308677;
	cv=pass; b=nhcBATu6jfTpiUAfXxzzxF30wwXIYV0vojFn93/TyTpv+0wbZ/4KIdYgApgJqZ/zqgFGAAzitrZ9Wxbsk93uLSqC3jcWspcZ1zvvTRw/iSUf43Op0VmZCSoDW2COoZ/u1sR/klry7G6goNA4z5dCVJVF18r5PG8zPh+VeWy1THGzDohEM6qiUUeieLZZbL4l5znQcXEuwrlpbtIxKBJiaGDhWGY2IDGMLS0GicvXmqnKe0RF2NSvUm8v2C9NiaC7YLlSorsKK7Enr4mi35Sebmd8C7lcS9f/f0EChMiSdK930UBJjGzUUQEDyOWwSHUOk3adVlVJDFn61zd/TYmWIA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782308677; c=relaxed/relaxed;
	bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otWa6iuNJ6BK/SEPggn+MH+dGo2RWnr3DMjKmf5fTYpnWxVDdbl0gjHvp4ojkykuzAV8AiXkvmjnfoZt18JIGoVHL9RuMKcmZGshUWHy4n2hV0itBKjgOlc0pv3h4266kpbY4Ls8psAMDt0nYyLiQqPvz98CNWe+k+Ec5bVq206oDxUZvQ+Io1W/Kep4/IeiE1YmK35FVXXjEWZC7Ne5yEmWvonLD3EBQJJ5dzaKOWgIX6x10k4d0IE8GLHSA+G3b2iHBp9NNb8XwnRfNEzkp0SfGQs7UntWQmUvfDKJXlAMH4uCmjvvHaz6Zp0VBvKRQGvbZ6GThIhCBs7evvOgsQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=JPg+LsFR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=gregoire.layet@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gljpq73XHz2ySg
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 23:44:34 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso11624175e9.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 06:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782308672; cv=none;
        d=google.com; s=arc-20240605;
        b=cvRnctKzB35ByPo4bLNrXAvZykxB8B4mysxcfh4QEya0HlGm2dh1TBGjcuVK9Wr0de
         w6wVWyF7k4iD0Vupa494/MhvIu88y3VkviCLK9F0MYaivB1LPw9RT+igyXgDTHcmulOj
         806C0/P3ocNsEJYsnU9CDtx2IG3basdQ7ZObKrD718Md3XmSN0i0wU36fCTGr29JJJed
         MkVsIctAVlDqlV6vcTJ9GhaMn2lfuG6UvB816ZIKREulw2kw2WW+/tPtn44e8fWfefVf
         IEGcoeAjBJvGHZiEmbeMVIXWNHrF1Lrzgp2jCglA6VcYeOYd9wrXzf/M8fj+yNnHmrbH
         7voA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
        fh=USwsYCQ3fxxtCNZTm7BjJKiZqoF55ELkAU9teOjhdiQ=;
        b=TYvyo6IFXTPv7GUYAWHeKDkp4GPYEggfTtvbVMLSHgLGxi7zIjkw+H3+aLbWl7Zaf/
         mQOd5R2c92F0ICVxoADq+OrEpQJKaqTFxjkg2HdTjWqSX8u5l7uCQqqRF5kfTLy2RY6q
         wlpaV53ER5FH1dMZNyuGQpBOVhLrk0SncdIDgOVZnPvUvr0Bn6i3UP9fHEk0R5Pp7N56
         6PklmtNkZ9GH7+Sj427DrkDjDGPrLyhCAP9c+K8gXC6oqXpQqLpbIw9qmnKy53Rx4+wp
         BD8y8he3xEyMa1doVuI9F6n+MWsMQR/OSwECcVY9OJ0JmbE48FywBpgmJiCKSI/VrHp3
         j4+g==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782308672; x=1782913472; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
        b=JPg+LsFRx1WoLOblp/dRBgnagyAYSgg8AoEqfXBjFh3+ZNBhRz2Gp8GJ9Q9s4s3h8J
         uRZHX8MdFuvGmRYrj4MYN7S/3c2TE29g5h4EqqUIutW53EfTeqbu+CJg89gXkOMsq4kw
         D72yu1Z+qxal0l96ap3VMZtt9q1ZmqdP/Otyk1L1lTSUB0yM1jPNLMGqDlHOEJ6Uto45
         YlLM6byRwEYGWapRgs3Myj4k3HuT17Qhq/DexYZTGmm1ZlfCfwMMDp1Mi1HMikNSoMI/
         qXsREnHjd7YUFI/Tv//D26Ru+jN732WzGsHxOt5JY9IeONeeJuNNjcKPG/e/8uBURqQ1
         32xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308672; x=1782913472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
        b=qArGyTl+ZLzvtp76OipD+OWKTdltCs0i+fil3r4qhdZf5oG5ACNzOYyE9Kuaz6pnYh
         iWCq5CwqbSxal1ARXtUSyLZLM17cpfJcrtJcCRXIDG/9q2NayGO/axhmMWz69GFepKH5
         CZxZ0jyQy8yMuh+R9PjiCJN02ISsIq5k7DNU4235yxSFZiiRpgpUbOMgIKJYRzNf6bYi
         dDFFFHKQvT+ro/tOZHXha2eG1W0txyeNF69RSAYpOMbl1jI0YKbolH0ZoA/z8vez8wcT
         W7mf7PfOxmXWqRbMTyZ/Uf+XzYgCAFZaIfuCWodYPoYuFkzVzjk1v/XVN0WKogvwZN/x
         DzUg==
X-Forwarded-Encrypted: i=1; AFNElJ/NHrmPfgHd02Pt05f3CGRlHWBRYkdQnPplHyU3cBButs48epWezDxyhFvH6oE32TGbJxN6BOKH91d+/yo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEEhJZKKn0wMNP/LgoPlvTiznLt3bxG8XKRMqO8VLNE/uTMuSk
	isco9SGYyzVDrHmlbCxSI+Cu+FN0xp4UiscGWVD/ckwyDY5UT9UU+556pNJviVU1RtNLrmh+jWB
	NFGr5aq856lK4sfZuIvsDoE+QS7lR+GeqyvII0rIgZw==
X-Gm-Gg: AfdE7ckSwEmMkfeoV6J6qWKwRDcJCOet+E90RUQCLJs/8y/eE+gJQEOoeVGKWLjJ9EO
	JD3+3ppi//ZxxDOfniC2n744OrMCn2BiqMlGbGS2QpM77G/shPhw5Ka5vK8s4LkOlbmvgCeyd5T
	sWm/X9VnpRXiGClLjS8llBHriIkq63NkgTBaszSkhSxfyxPz3CApYT8D5gL1iPOiv2/xClAjCrg
	jp7X5BEd7eBZDM/2eLlqgTIO2ZpMC2LSPa+eb0PGeRx91moS4TX1eI/GB/fAf8k2rbmxVu0OB+s
	Qdw2AJAUeuDx7vLDMpOV/19xZdzyxiUlnTQOkCD3dPxrWeux3uFKTgs4cA==
X-Received: by 2002:a05:600c:4ecb:b0:492:37b7:607a with SMTP id
 5b1f17b1804b1-492608796bemr50951345e9.31.1782308671484; Wed, 24 Jun 2026
 06:44:31 -0700 (PDT)
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
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
 <20260624-copper-albatross-of-youth-6abae8@quoll>
In-Reply-To: <20260624-copper-albatross-of-youth-6abae8@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 24 Jun 2026 15:44:19 +0200
X-Gm-Features: AVVi8CevgRC28tg2RrmLdkUxp5ymSnVB-xqiyZURryTvD9U9Bz7rA-Yxg2vjrr0
Message-ID: <CAFi2wKY+JZZV5vKnKKO91Bk-903+HVKm2a6NF+fufri0r3EjCA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4302-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[jms.id.au,codeconstruct.com.au,v3.sk,vger.kernel.org,linuxfoundation.org,kernel.org,lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,lists.ozlabs.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F57E6C1E74

Hi Krzysztof,

> Please start testing your patches. This for sure fails tests.
>
> It does not look like you tested the DTS against bindings. Please run
> 'make dtbs_check W=3D1' (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.

You are right, I had tested my patches but wrongly. It is indeed failling.
I'm very sorry for that. Thank's for taking the time to explain.

Best regards,
Gr=C3=A9goire

