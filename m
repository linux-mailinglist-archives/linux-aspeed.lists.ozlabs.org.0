Return-Path: <linux-aspeed+bounces-4226-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aInODClGKmo4lgMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4226-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 07:22:49 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1566E834
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 07:22:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VB42ULSa;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4226-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4226-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=2")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gbWHn21Pyz2yv2;
	Thu, 11 Jun 2026 15:22:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781155365;
	cv=pass; b=SX7EhPPQO2Cm+dtIKI/50YkM9kOdYifmJWCZ7QgMacq5xiY8BUJhXHgZTgk0GIeMQEC2JKq1kDJHVdeqibO9KMg241eQdN28IOI9jgIxTmFXSeJzBCfTgNU2vXGnMS6vC4MRq3iajkWgBJv8aRpJLOpUZ6qtnzi8t9PC1e0pVlw+3AF0p02/wMCQniIGR0nW3sTh/7AvD36haICChW9IsmgW7v+ZkQBVhlK8i9kkEbZ+dzHZY+xGhXmRyO38fmpXErvYlS+juYVxECTkPuxd5s/rJZfnEoHj2Ra+ybffhFKsew/cv2eG8zCU4tndj3FpSXXwruGWA/pTwghNdKBloA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781155365; c=relaxed/relaxed;
	bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKmL1wTp1cFw9zeO2gsAoQOx++PdC6WohV6m4jBbxkuVyKwLQBjUQ2qSAnC5XEe8ETDlCQb1fYnntD4yYB01zKgm7FpOzMSi0BL3/vEwyxuX5eT8gmkEMEWbAePguC2s0GYqzwYeS6ZnRB3o6BHe1c9V2o6aoN0UuRiopJfmyUfObAPvTnzsPz225halkj49w6i3veOanZ5EW3JtD1gvCq8b3ZQqHKe0w1UXVwCBLofaNPh5nBGt/XkEtdhyk1PggiJ8cwqC8zWtJfoltc9iK6YrkUBOpt2apQtpGaSuLlZZB1VUnsHz4nq9jvjVe5qc1BDMYLvH8YK4nqCxNd9H4g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VB42ULSa; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=kylehsieh1995@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gbWHl2Dnbz2yMl
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jun 2026 15:22:42 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3965bc493caso69911891fa.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jun 2026 22:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781155358; cv=none;
        d=google.com; s=arc-20240605;
        b=BYx8EGWb8AVoXFtEiQKyztUg/9666FfHwf4ThK77v6BwmOYFh/JPJ5P3Dq/HJDmR+F
         yR1nwEzqLKZv8R/Ojtrm6Pk3nGZCtlkCxctAfcXy/vapH6Jfqow5ZYnLL7y5IxS3bBiC
         1+zHzvBR1h+dEykfa0QTrhYOS6vZjKGDULEetVR2/e8IK6Qp4a2n7IpfS7vnKkhQbcJy
         icNHiy2jmXbWXh7hNufjSiJpzCetapL0bJlr2GzQ2hL1DmlmltDumpw3AMoODUCxvanA
         WhAOieI5I/VZz4sBlB0Br58NwwiAt+TcNwJx2FWuqsdRJhb6OhRx5jjZd1OW3vydK74t
         7/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
        fh=GzMvG4Xk7BkEawhC9T7Czo7xrGdrF1RbGFTrQN6lC/E=;
        b=jsshqkMXIhFrdAgu/hj6+bNAG3GtaV+qj7rM35428eoVg2l8Iq7pJLsgTtW9NabV2m
         G6KyHnvOaXyXG67ovEesU8PII6HUkw/qyNd9ZZHQc9cReG+S/cisgFytIGStMThSYJBc
         mMb86Ec/SUZdO6ra6AhyJLoMrBgTiMmdD79cuGrVsR5NMbi4K3bLDWUs+2hTDy3cjI9N
         VT/W5o11U4gWahpQ3ExzX1TFYLIo2TWEc4si6/x8ZoB+Mgj42S+wHQ5vrwwFUmYzCU8s
         TOKQ5ztLI1Po/X2Q0s276IVnkre0JrecXPC9CV7nn+ZpZv6aMvhu9lUHFAVl+xvW78sb
         t19Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781155358; x=1781760158; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
        b=VB42ULSaBpNNdWSKzxDM7La9S8MAhT5KBJLvX136rBoZWjGacqHBpWnoJ5mEpSfXJZ
         NHPriR+Mw7xDlIgnvdn1FMzD9h1QUpb7KvYk2w3DIvvHQ4GuFd+p7789EElzKW9H0QaE
         geyCps8YriROqN7NqgH4HIO3U3EeajZyHZsX3CFyWBLS/Jv1tA9DKSoOqoK1YcfKRDfn
         KSyafu81FGB4m2IgCNGJo6Ig11JlGeou75tqOi1xoTzzXuRliTCCuMOGrdV5D1GOPEAA
         ixNcUqrIzd4SrUU3DFO6mJeV4EalC9qOPvjSG1EPUs44PvgRVCx5yhfpSXoOWA7fW/ZC
         Ib6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781155358; x=1781760158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
        b=YakkaCrmGZLyc/zamMXrxcogqZqXJKxaeHmW9HuKWXoPtDZJbwvLUhCW0EMgQ3vzH9
         OMJ9pZuPQAHVU7/8EZ7NWgntCDcJaDKK4YbInLLcU4U0fnxVoKZLibVeNpnSDCkzbYH1
         C3KxCIeelVNS8/mnkgMUHmshG81lC3yYMU6FTM4iHd51v5Ru5RUpfJPSHXYPrBVjWn+p
         q7h2V2FE3jyX3ogpZMrbbuVdecvnuvTLXclNnVY++0zghtpjJxa2hr2BJVDZxixf77do
         98Wf9p6Vf4fq3RaGhX4rte/LShIgwZO4VH8cScShW0bMmB9k3OhnwWRl6AAq1P3kIlxl
         LjDg==
X-Forwarded-Encrypted: i=1; AFNElJ+grV7cTlxgbFAY8YTYzgvIW86kdoRKlHZPIdcCrSeO45W+ISQIQP+n7TLwgdntOsz32iNiZlis4eHG7Kw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1HNaCH7SbKdK+oGJkgVOwhbsHUSFWFWgyGulI+mYIukwBLzTZ
	4OTe2oN61Ju60RHNasWcb9j8hW0nruMwmThBiZVYgM1SUeqdKO0zC/USSgOLmOOvXKHg7x2V5O/
	66wCdTh0jInAh1YA4xP97NOVic2HGUtU=
X-Gm-Gg: Acq92OE9puZpVKiRfA6GRdmCUaknyNsfXgHr9Pt8vVJQ9yVccDhvTLP9HP8RlSV8ChT
	2X+E8730wbmBA+Jw76wOd6oskYdfkiaMxY1pBuOSvZ9YLHwCq25yexmY3UyCZIPPRg1tjPFAU8D
	B5Xs1NAtIYg4Btq3O8LdFivtYVIae4q6tNTyrTbxZ8LOIE56UXTpL2sQpusddzthHW27VhhZc7M
	/1bnc2JWG10ZvnPHUD41NyjpBURDJ5pABOM3jHOFJfHbFrcFP0IFm7iOcws5i/hGemHEo+DhzUs
	X/6NN9cDjNQSCR5JC1k=
X-Received: by 2002:a2e:a583:0:b0:38e:d3e6:a89a with SMTP id
 38308e7fff4ca-3991a083973mr2593601fa.20.1781155357644; Wed, 10 Jun 2026
 22:22:37 -0700 (PDT)
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
References: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
 <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com> <a8cdc7c23166823a8e1969408c667e6a8d758fe7.camel@codeconstruct.com.au>
In-Reply-To: <a8cdc7c23166823a8e1969408c667e6a8d758fe7.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 11 Jun 2026 13:24:08 +0800
X-Gm-Features: AVVi8Cckj1KMTx5QCbBfuV37allJnJRrSd1WRpg0xdewL4kFILvgYndyDD6MebM
Message-ID: <CAF7HswMxtzD5KoQRGx4ckA4fUbFr6P7XXnTff_Z+_DmN8i37vQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4226-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kylehsieh1995@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kylehsieh1995@gmail.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,codeconstruct.com.au:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBB1566E834

On Wed, Jun 10, 2026 at 7:22=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kyle,
>
> On Wed, 2026-06-10 at 09:22 +0800, Kyle Hsieh wrote:
> > Add linux device tree entry related to the Meta(Facebook) rmc-node.
> > The system uses an AT2600 BMC.
> > This node is named "ventura2".
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>
> I have some comments on v5 that are applicable here too.
>
> https://lore.kernel.org/all/3d56889c004fc2d11b76ace6033c7ccfb8a37d03.came=
l@codeconstruct.com.au/
>
Hi Andrew,

Thanks for the review and suggestions!

To briefly answer your question: Ventura2 is Rack Management
Controller. It is a modular device primarily designed to manage liquid
cooling systems and monitor rack-level hardware states. Its key
hardware features include an extensive I2C/GPIO topology for
tray-level and rack-level liquid leakage detection, as well as MCTP
over I2C support for asynchronous device communications.

I will remove the redundant sentence and include this detailed
description of the platform's purpose and architecture in the commit
message for v7.

Also, the Sashiko AI bot just caught a missing `idle-state`
configuration for the MCTP I2C mux, so I will include that fix in v7
as well.

I will send out the v7 patch shortly.

Best regards,
Kyle Hsieh
> Andrew

