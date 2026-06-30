Return-Path: <linux-aspeed+bounces-4325-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vKB6FWVWRGqNtAoAu9opvQ
	(envelope-from <linux-aspeed+bounces-4325-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 01 Jul 2026 01:51:01 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB06E8B9A
	for <lists+linux-aspeed@lfdr.de>; Wed, 01 Jul 2026 01:51:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lrlJJAyQ;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4325-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4325-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gqfzX323Gz2yb9;
	Wed, 01 Jul 2026 09:50:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782820387;
	cv=none; b=ccZfX1eyks3lLu2n/dig5Hln3kLXYzDXzzc2u6QmJ75xaOQogtOe7MDwZAdQbCEgSi/kKWgWefntAkTBL2UzbEIiTOe7lzoL9nSVclz9qN6E+7BcopiYAWJfx4/IlpsereFEACw2/uCjGtqDJUewu5ycpZZEW2AvHr1RRbPEkbn3VP+BGa0UBgGHMc/JVi+1JWMu9ZMCgL5g9n5IOznj8ZVMFJeMidYAZWiflNzUKd6ecB0UcD+EuNw1b2UyY7l/CVMZ1Fpd/9cDGdsCI2yulsF/uxpJLuFpP1S/boY7nNmmonPCHa2BGrpM234iPTGgmifax6/YMlkdOx1oWk7/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782820387; c=relaxed/relaxed;
	bh=493enOlPSgfL8Xi3QDIl1rddbYGRJGRVQ1cUt/F2sHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjxV/SqAkjJFAgJyLUfeCpJUlUDEsSsxKMOlalhAPcB885hW6TkkRLaLxHG1wmDErnX8v6uLBcDsK2HkTrHFT4pFf+0OA0SVK8rU4ERl6Kg5GXtZ4xrca4cgCxunbjicWynt7eMfSam+MUC+G8PAb/5dvyw8C684HK8hi1sJrsAWYg1K0arsjXYy+4EZ20qZ+OLkxFA7h0KmODWben+/DxTrpmattmDiDMZANjT8l357ox0Ux/EvNHoFwGCtnCSelAbKJ61GcG1yQ0ea2eCcTRMGtK9RTmG9oAXmH8JV/xYON1/571HTyIP3K6Q8kHuDxi3+iFyHonFbpW3SMjRAVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrlJJAyQ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gqM3Q4Xqmz2yZ8
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jun 2026 21:53:06 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28B5A41321
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jun 2026 11:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA681F000E9
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jun 2026 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782820384;
	bh=493enOlPSgfL8Xi3QDIl1rddbYGRJGRVQ1cUt/F2sHc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lrlJJAyQZ3DwijrvkQSaLW/aK3tq35nYYm/c5Fotxi0Uq/sxm/MTtkXjQNgg0Fgxp
	 KeYk1xrd8xyH45/0n3famjiuhyGtB6ePQFrOG+P4ANJc9Ou8bDFFyq+PNnitfddnlu
	 nn8vBTyx8KO13fiCz1xG/2id40eL/RmVJCjK3vGEmGii8y2HbrdEeYthuisNvkEIXh
	 CCCVjANnb6ziEZe65ted0H7vtlp+DAVwnUfFYjeCgc3a3U6n7+/78RExC2z3Wm3HG3
	 7kx01Gi09g0a+U5y8Tp+vSCr7ClStQFBUwDMXbdFuGNBF84FtfwlnzLaY2irwtKLJ8
	 R7rE517rnSYuw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b28814916so1461721fa.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jun 2026 04:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoHnPCTa1nIGLHHXG9Lh4NZjFT1ifXEh+WviQbJ5w2kEVBulaefM0QN5l6Mf59XdQOXn0veHTCuk8qC8vs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJEG7amfIvYApUVQaHCR/AOsIlgfpRwEF6noojOhG2Hdlfg8D2
	EBcOrWAWz3T4W6lUuqIFietX/GeXWptajScBKRdxxIJ3ClCwXbCN8mNFUoE6DEKxzAXRRQ74+AJ
	mluG8txHIC/V/9BbTNehCJU0D0vmEo/s=
X-Received: by 2002:a05:6512:15a3:b0:5ae:afec:8afb with SMTP id
 2adb3069b0e04-5aebdbdd0bfmr741396e87.48.1782820382868; Tue, 30 Jun 2026
 04:53:02 -0700 (PDT)
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
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
In-Reply-To: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:52:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLm3-5BP+1E_DLTZvEPd1ugMZrXiOjM+Gqnn9Ri+uNWuPw@mail.gmail.com>
X-Gm-Features: AVVi8Ccukh9jeKMJzDntWFmdET_gKKyPu4vZydSTvGPFTsmFqpaNo79r5YLA3x4
Message-ID: <CAD++jLm3-5BP+1E_DLTZvEPd1ugMZrXiOjM+Gqnn9Ri+uNWuPw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: aspeed: Make AST2700 SoC1 JTAG master TRST optional
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4325-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:billy_tsai@aspeedtech.com,m:andrew@codeconstruct.com.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,aspeedtech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63BB06E8B9A

On Tue, Jun 16, 2026 at 4:30=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> The JTAGM1 pin group of the AST2700 SoC1 includes ball D12, which
> carries the TRST signal. TRST is an optional signal for a JTAG master:
> designs that do not wire it may need the D12 ball for other functions,
> but with TRST embedded in the group they cannot use the JTAG master at
> all.
>
> Split D12 into a new JTAGM1TRST group under the existing JTAGM1
> function, so TRST is only muxed when a board explicitly requests it.
> Patch 1 adds the new group to the device tree binding and patch 2
> splits the group in the driver.
>
> Note that this changes the meaning of the existing JTAGM1 group: boards
> that do use TRST now need to select both the JTAGM1 and JTAGM1TRST
> groups.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patches applied!

Yours,
Linus Walleij

