Return-Path: <linux-aspeed+bounces-3971-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCkAEEZJ8WnAfgEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3971-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Apr 2026 01:56:54 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946548DA2C
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Apr 2026 01:56:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g4y5X2tWLz2xYw;
	Wed, 29 Apr 2026 09:56:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777367543;
	cv=none; b=DtWeyKow4Fo7biJnwyJwGDAOyxvD/nARQySeIIkGVPwVIto9/fRpimPGTqHsgG+yYHwTMMuAc9bfVsJ/S3fN7wqDtCobs8wQzbQhUGuV7dLjuNURgZQjfrZbmQ+v7kHFoNI7WdAn9lYi3NuEfzlbzJ4C2rRdabQSJxGWn3QFMmeINCnbNj3OXKJlYZi5yNWl0t0exobsH4LE1OAM9r6UGZD4lRyf8mJIkw/M/ZeMUbBBKt9rP7BpwO2//cZG2UKK9lVvUhcJ9PFq3KbYxAgg7uRLf0Nqw0x3S24dDm2Ny8gVbcNovl/iw7OA9Lc5FNzEkNe0/YetWPjvp3/MmvVm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777367543; c=relaxed/relaxed;
	bh=uGpC8OFfJjEvHGP90N4kTx5472dBbjEkP4ZjjoHaizA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJtl4jZ//ZTQgcRMOTMNJLsokmWJI+ZJzLnz4gahymL63PGtC6U5s4AEc4AoV8urA3OgjQGVsauHCYWAQuLYewtw26h3WSTUVD/v2xeGGUz3JH9b/RnA18N3NdWJ1HoUvUegctfWsscE9o3nGiP5AKuxsnIUJCNCmzfpBBtF5lWEHpvor/L4frXuLbrAaciwLQhDnSo0ZVohvOt7ih8ryuOhQGGqMJjX6iBRj9LFEunnndM0VHiH7DMvz1sHwKX9U/DqYJkmasstsjgMHFfjotB1z4fa93cNb+/opUWTVRwbT7HpRVgwSKFVw+VqqRT/0rT398tTlDe8so8zin3plQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IRmGXFgS; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IRmGXFgS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g4ZT317t5z2xcD
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Apr 2026 19:12:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5935544961
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Apr 2026 09:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1831C2BCC7
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Apr 2026 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367533;
	bh=+vV1cq1FE3OBlSf+VVLa+jyUyRoJrEi+/2DabEYx9HY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IRmGXFgSvCF3Yu7x4FvWQDcCfcF7Uwqf/IZmGl82fj2/WeDWxn/pgObJKt4DQMzpU
	 QKLOgAxg/wzYxmTWB5XpS5M4H6igwy0ANhBCnNK4qLQ6OY8lkfwQJ8JxHbnrBxeO6U
	 FhdgQs0Xf5cx9Hlwuzw0fMk8buKjpCL16Kkl3D7UIDZiLjMhpiTe1v7+WL4PxIRBaO
	 6RtJ9t1uUjUH0p8HzcPbX2Kr0KZEXjew3tzqcbGHR7UwG1KUzwDdS0hf31uPu53ccm
	 z1pgh2L+o1a/9G3lmV2sDmbXiwtSUkfU8Ofen7fKzYF/3/CSrS9AOGtfVQ9cYAdxKu
	 2KsFSmz+NLn8Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38dd575bca3so107587881fa.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Apr 2026 02:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9HbfUK5GNHJLVdmxJPf7wMvRjCCLDjgMqm5RvRIIfRjTeWQ6P+6Wxi91fWI/jhzovIueyFZhUC5xtAkrg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxaBnt6X1fDFPWcdt8t/Q6axOgOMSxulfyhZCEbxzMSlvKvTvuV
	tYZtFBIsjFpkU4XsmG2E4ujOQEYBnrDLl3917rJq8rqAukc307tLCu3HsvHPcIahp8Gr05DSgku
	P4QaYL3qSXUobdijJsjqvHyC9irzOQms=
X-Received: by 2002:a05:651c:f07:b0:38e:8357:c5ae with SMTP id
 38308e7fff4ca-39243147e32mr5888901fa.9.1777367532541; Tue, 28 Apr 2026
 02:12:12 -0700 (PDT)
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
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com> <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:12:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Ee=BdLarnwFxM6A0+G9rYV4NJTm2go4p91ArZy-YLDA@mail.gmail.com>
X-Gm-Features: AVHnY4KEPMN0rWMtFgqCeeIxS-mVWtisiUNAOatuMw1puUfVBGi-Zw3AeUL_BJk
Message-ID: <CAD++jL=Ee=BdLarnwFxM6A0+G9rYV4NJTm2go4p91ArZy-YLDA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Joel Stanley <joel@jms.id.au>, linux-realtek-soc@lists.infradead.org, 
	James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 6946548DA2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-3971-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:afaerber@suse.de,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@codeconstruct.com.au,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:joel@jms.id.au,m:linux-realtek-soc@lists.infradead.org,m:james.tai@realtek.com,m:eleanor.lin@realtek.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]

On Fri, Apr 10, 2026 at 3:05=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> No dedicated maintainers are shown for Realtek SoC pin controllers,
> except pinctrl subsystem maintainer, which means reduced review and
> impression of abandoned drivers.  Pin controller drivers are essential
> part of an SoC, so in case of lack of dedicated entry at least cover it
> by the SoC platform maintainers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I didn't apply this patch since Yu-Chun says it will be applied to
the SoC tree.

Yours,
Linus Walleij

