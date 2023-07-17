Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0760C756A34
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jul 2023 19:25:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d87713sw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4TVn6fXdz306p
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jul 2023 03:25:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d87713sw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4TV86YDZz2ygZ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Jul 2023 03:24:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E99A6117B
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 17:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7488C433AB
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 17:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689614686;
	bh=7K1NrqOEnIsov6LNPMbWxEcmOTQ8DoOSUXf5nazDWnY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d87713swd+8flnDOEBdwYxJh+zPcc7RahC04ehtpicfiWxmDmyXavKTgMxupa9u60
	 uE518sCiopXnFJ5xCs8ps7AxbLJpCW4AptGYKBTNIiQidXwSpvzEB5cKMRJ/MBlDoP
	 opnSkxxGtXA14auVA+sh/vudr8u275YmFGfUA91zf1AAcmAnxNFFf4fGJAdedgjWnV
	 ZSPzv/UMDBMpnzH2k96dEQ49n2MCVBSEQXB7YPqF3SeCNKY52z3KHOXEeRgekW2mOH
	 tDzxWE8RyIllj4sJeBybKdla3Urx8w4VbLFEfAhwfym2dc21ty7k7xWjwKiODqmKZK
	 phjNQroLqJXQg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b743161832so71507101fa.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jul 2023 10:24:46 -0700 (PDT)
X-Gm-Message-State: ABy/qLZkTfg1YxNy8d3yobadgNTgN664GX9KqKAJjSDEvdVOv6np968O
	iZ384X1pa+2zRpvJ0dQxHUr4Wi70EZ/HU9w4uA==
X-Google-Smtp-Source: APBJJlG8mEK4npwacHnkZf+THmzcOFSnKgn7HaAY1ey1gKBCNN6LRJvR5ho/gv5Qa7cQ6Y9pK6LCgVvVrpJDCMni1K8=
X-Received: by 2002:a2e:9f17:0:b0:2b6:cb0d:56ae with SMTP id
 u23-20020a2e9f17000000b002b6cb0d56aemr8218837ljk.11.1689614684790; Mon, 17
 Jul 2023 10:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174607.4057185-1-robh@kernel.org> <e0e1b465-8419-419e-90ae-4b72f5189469@roeck-us.net>
In-Reply-To: <e0e1b465-8419-419e-90ae-4b72f5189469@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 11:24:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJZcxoQEhaGr34Mk1P_8vc8wctcfzswWc8VbRrsv0S7zg@mail.gmail.com>
Message-ID: <CAL_JsqJZcxoQEhaGr34Mk1P_8vc8wctcfzswWc8VbRrsv0S7zg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: Explicitly include correct DT includes
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Saravanan Sekar <sravanhome@gmail.com>, linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com, Jean-Marie Verdun <verdun@hpe.com>, Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>, Nick Hawkins <nick.hawkins@hpe.com>, Sudeep Holla <sudeep.holla@arm.com>, Luka Perkov <luka.perkov@sartura.hr>, Robert Marko <robert.marko@sartura.hr>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Jul 15, 2023 at 10:55=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Fri, Jul 14, 2023 at 11:46:04AM -0600, Rob Herring wrote:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Applied to hwmon-next.

I found there's a double include of of.h in lm75.c. Can you fix that
up or do you want me to send a fix?

Rob
