Return-Path: <linux-aspeed+bounces-4197-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n3ZTLcVTJ2pvuwIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4197-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 09 Jun 2026 01:44:05 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8165B36B
	for <lists+linux-aspeed@lfdr.de>; Tue, 09 Jun 2026 01:44:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jdyPmYcZ;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4197-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4197-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZ7ss3TB2z2yY0;
	Tue, 09 Jun 2026 09:44:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780906781;
	cv=none; b=H3SjPpOvT18jn2QVFYGMQhrbFOfYKba+iBJPbpIvH6n5FZ5We5wmxkleLXcNFW/cQx4hcTipHKZYH3wOuv3ua8yZS/MFgS08D5EMnPKADJpuPKM2NidVQAkWCHP0dftuKl05HoLGAziNjmmQWwVmvwkd7cT5D3FSTXJ5vUewy/y6qAP7Hy8s8zx6ufrN9f7SBBh7ZR+K80ShMLd1sYt1HHjj0Lv0d1We96ItD9VMZr8tNcWXzwjNlrJZjq+jcgpIerYPtMNJrvOyt0Ffw2/JhyZO1z3PXRp2esESMx+U1E3bTvCVVxkbRRog+JlJO4mz/DXF6eeYpZT/nFM/KvHoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780906781; c=relaxed/relaxed;
	bh=P9V8bpEqH6X4qmiHHTngsXUmKEwdN1ijUIAKzpeA0e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I62Fzl1Lc14V6VpSKUhB60NyFAnPWiuMyNbSJmaP5BXQnD9hEXK/n8p9raDsS6sAxTGQuPYmmCDgrFGVBw25sD7b2x7i1bn5xVgSav78RNdi2b/5jBL9va+gBoJPEov1BgpwHNJFNxuCmTq8YS7pI/KccK0Kh6wGjzZgigeE427wi2FnJhEYUPruKEuiymA+PWnqKUrMYUzVrHclYXPKYDq0NTXmR3RfOgGeomchcghTef/s40q3QSl7FafIUubtVOxqWxJ9H4nk9ULAQHgsloqRaaKQaIV9d+x0znedxVzR2ZdejqEiN8l1QTkq8y4WebcdjmEAEBB6ctqylVl0BQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdyPmYcZ; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gYlMJ3BDjz2yRM
	for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Jun 2026 18:19:40 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAD1C601E6
	for <linux-aspeed@lists.ozlabs.org>; Mon,  8 Jun 2026 08:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1981F0089E
	for <linux-aspeed@lists.ozlabs.org>; Mon,  8 Jun 2026 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906777;
	bh=P9V8bpEqH6X4qmiHHTngsXUmKEwdN1ijUIAKzpeA0e0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jdyPmYcZAAj5zajRoCfCfEUTkYIVOgfPo3QAIyGqN11uGTToJ96WZpRYI0Lx1V1I3
	 2eDiVxAVrjMD+r/rHA0O6EN+Xl/szMs37czo6pzDR2xjCsJaqy4C2T8XQUhardqcC4
	 wOVSKLeTDhpcRDpmIuCcZCuGpajZ+Z6yMKp+XxQYO40vtow7leMRui1N0onxuNgo6d
	 Y6kupuQzlyi3bLPrd1WFHetFqT79kvx1hKimlQO9ryGMPBJdXGGAG1N3GEuEkvV+F8
	 /KKqDFEeFmZlnACZo8EBEMPgG7o8c/hTqIRVA1Rj3USn5jfsJV3biifp/Q5X5nPDHu
	 IP9tg38RSj/aQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so4358817e87.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Jun 2026 01:19:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/oPv2cctoYC0+ZYs4zWbC1MYxiuLV45IwGpGYt9eZB4D/POxFCTMTxFMSwosEhj9sUZXmiYADzVYdXzuU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKgXcNLwpRZnvzdBbA2Jfu2wn5NhI3ms8rr6+oCAT0yk222C7B
	l/v9JnOT3P/zC5QnC+GhsAs1LrC1BIyBd7HotsrkuXNjBP8iUj4YsPZ2Jru67IRA/efyW19VoIy
	vltx5nfqTqTC5iIBoFWR/HBJnax2rLOM=
X-Received: by 2002:a05:6512:611:10b0:5aa:703e:ce64 with SMTP id
 2adb3069b0e04-5aa87b6fe39mr2685769e87.14.1780906776095; Mon, 08 Jun 2026
 01:19:36 -0700 (PDT)
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
References: <20260605-pinctrl-fix-v1-1-3d8cf7a6c348@aspeedtech.com>
In-Reply-To: <20260605-pinctrl-fix-v1-1-3d8cf7a6c348@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:19:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL==MdwmEM_9aHqfCnTfd4=g174Ytk3dZti0pwqcfU_UOw@mail.gmail.com>
X-Gm-Features: AVVi8Cd0BwjOsWouqsrdYZ6Spm4i_Ll_H2pHRD9M65EFtdOV_cK55fSj8mFOoj4
Message-ID: <CAD++jL==MdwmEM_9aHqfCnTfd4=g174Ytk3dZti0pwqcfU_UOw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPIO mux value for ADC-capable balls
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-4197-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:billy_tsai@aspeedtech.com,m:andrew@codeconstruct.com.au,m:joel@jms.id.au,m:brgl@kernel.org,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,aspeedtech.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0C8165B36B

On Fri, Jun 5, 2026 at 8:38=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:

> aspeed_g7_soc1_gpio_request_enable() unconditionally writes mux
> function 0 to route the requested pin to GPIO. This is wrong for the
> ADC-capable balls W17 through AB19 (ADC0-ADC15), where function 0
> selects the ADC input and function 1 selects GPIO. Requesting one of
> those GPIOs therefore muxed the ball to ADC instead.
>
> Write mux value 1 for balls W17 through AB19 so the GPIO function is
> actually selected.
>
> Fixes: 4af4eb66aac3 ("pinctrl: aspeed: Add AST2700 SoC1 support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied! Will be for v7.2 at this point.

Yours,
Linus Walleij

