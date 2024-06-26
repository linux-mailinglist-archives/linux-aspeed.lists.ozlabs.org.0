Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2514B9184E2
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 16:52:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fggi6UbN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8PnK0V4Vz3cV5
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 00:52:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fggi6UbN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8PnC43n4z30T8
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:52:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F1A67CE1F77
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 14:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7FCC2BD10
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719413548;
	bh=p+XN+J1QG0TSF6wkOaWsLCfMjOFWbhsblfaxn3Z0HpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fggi6UbNDcTWa3faSDHuGkwRzdsm0zBrdC7kwTzw/0cPVdMPwwLueasBsM4OgXRmE
	 gHssK8hEkIaNJHv4ZAUeGYSIVlHWjmRaa4ywIUOFtTrImHnwCaLbsIEZquyp6Ncag3
	 PGaPkDOyGO0dZi7avT+imA3Wm/+QZEQTqVUCXExQsvQ7OmUCGtmUdU7tToo8gSsICA
	 sRBAtDbwUXb3Vz48wOIb1aiBcQuDVQnW4VCUysp9yuzfjiV1eWPpo9Rfh/R4mIcwUi
	 WIXNxvxjcMAvJYJLpQW1oprB6iZh1nffmdVPfkJhVs+q0QuxNX72929XbeFfAfBSoy
	 Shf8I0buuqjwA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cd8897c73so5750160e87.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 07:52:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoM6D7mZVuPSoUIdKo8vKIJBVjZ7Rniw/7l+mf5SWcuHtgyFq/xOSqBtpSDxsBpTbQf/gyJXwvv8Of3FOyWx9uQ0V/pIZTcwKK2k3oKg==
X-Gm-Message-State: AOJu0Yzyf+gOpkzzJwybx/zmbw/hijyyz6v3bRRGIjkoyXdKmUGz21F9
	fRN7gw365R15EYX+X3nxcZZnRqij0MfJ+8V/nyjhmKqe1bIArnI9U+fICEWw3rqhA00GS4PShs3
	ZzfpfEtwtrQTqHsXslw6iBqGQdw==
X-Google-Smtp-Source: AGHT+IHNvCTNwK4T4lkXJuBvVMBLoM2lndtIpJqaNqZpElj3A9xLin3LwzfuBXbQ5Q4ouUkzu77XmEI6Vpn16RqP/Mk=
X-Received: by 2002:a05:6512:3a2:b0:52c:dc70:ebf8 with SMTP id
 2adb3069b0e04-52ce1834fb5mr6308191e87.19.1719413547191; Wed, 26 Jun 2024
 07:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
 <CAL_JsqL-b==HMLJGd_e-43yZHjBFYrrLV5J2a=E2LSEck=ii6w@mail.gmail.com> <CALFa7M8bgVX_L30J72SqZ-0vzfezoJLtZHnKjL-dZki0kMJFoQ@mail.gmail.com>
In-Reply-To: <CALFa7M8bgVX_L30J72SqZ-0vzfezoJLtZHnKjL-dZki0kMJFoQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Jun 2024 08:52:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKMVKuQfZeU1xEmSQ2QaS1JPd_u5z33r2Ni0qbfzUvH9w@mail.gmail.com>
Message-ID: <CAL_JsqKMVKuQfZeU1xEmSQ2QaS1JPd_u5z33r2Ni0qbfzUvH9w@mail.gmail.com>
Subject: Re: [PATCH v1 00/17] Revise Facebook Minerva BMC DTS
To: Yang Chen <yangchen.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2024 at 8:02=E2=80=AFAM Yang Chen <yangchen.openbmc@gmail.c=
om> wrote:
>
> On Wed, Jun 26, 2024 at 9:38=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Wed, Jun 26, 2024 at 7:05=E2=80=AFAM Yang Chen <yangchen.openbmc@gma=
il.com> wrote:
> > >
> > > Revise the Linux device tree entry related to Facebook platform Miner=
va
> > > specific devices connected to the Aspeed AST2600 BMC.
> > >
> > > Changelog:
> > > - v1:
> >
> > You already sent v1. This is v2.
> Hi Rob,
>
> I appreciate your reminder. Should I send another patch series and use v3=
?

Not until you have changes on this version.

Rob
