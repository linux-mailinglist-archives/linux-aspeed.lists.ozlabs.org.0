Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D776ABA93
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 10:59:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVYw00WGJz3cHX
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 20:59:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zK2NCcCp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com; envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zK2NCcCp;
	dkim-atps=neutral
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVYvt2hkmz3c5D
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Mar 2023 20:59:36 +1100 (AEDT)
Received: by mail-ua1-x936.google.com with SMTP id x40so6020165uaf.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Mar 2023 01:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678096773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYIx7+Ak5uvLBEiqCaz2EjTEv5YVga1eqk3WlIV6f4M=;
        b=zK2NCcCpt9UU5XWW7P556fwgVJnEZEkgL1VUMcs6Mj43IYOEvoEhfp8gfGUsPfLC9y
         rr++bTyCnBcdN2dngclReRJLaxoST8UztHhb1fDmgWvgza6vB+TGcRfhIZnGtRSmxWAH
         1CVAD5hZIQVINYG5pgNlKMDawgjanCiHOlNjBOd0Fuk+W/0c+b4uiCC8Xb8KXBnI095x
         8QLYEPPLxrfg3p8bJIMPf18V36pTcBfCfQstjYus6E0Iq0L5ShKu8Tzt04xYxOeI4YvW
         nDIag/4yGtMlZV2g1dzKtMLxiEvkUPlPuFxOlgkxt4MZrtxvdOozHO6rLF0cmXE46pon
         ntHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678096773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYIx7+Ak5uvLBEiqCaz2EjTEv5YVga1eqk3WlIV6f4M=;
        b=AOZLcNasmoTtW+uaO5iury2ihSDgvahSJUP8u0HbMQgJM6EXiFewtzSsEps/ceqVng
         osDssZr56kR6Lg7SHXDEEldBbvD60HG8T7v8wCocmpe783nRqVNPEj7eySCtNIgmTjxf
         fuw9Wv2z0p4S3FV2IUUEs780rgp+bOHemjpf4RvESQwvxP677PmkfEN5aaKlSGyRofH6
         tKRbf6FgcvepWovOOsjuSvBRWCtnUEmyobyRY8eryQrOX+7FeU5RZR3zk2KBz+y/q6S1
         RHCiC7C23x42HucMcYdctw6S2ebeEcblamt1wjB2lV0kvj9Svdyw5l1KWfS/T4ZEbTfv
         ehCw==
X-Gm-Message-State: AO0yUKWkR7JdFT0cdm2xHkzEKyqbRM7OaqCFLDrLI3NP2n0lDw/AlLgq
	Ua04v6/oV3CuWcoKEidEJO7wqaAq+aFyaWSwc1QqEQ==
X-Google-Smtp-Source: AK7set86O3qpveh/FrKfkd3g2XuLPEZoo2Pf5KYA5+piHq15fqYnN6m4NMoJVYTy0MLAeYsy8UJPiyEY5BxmJfkfHGE=
X-Received: by 2002:a1f:2dcb:0:b0:401:42e5:6d2e with SMTP id
 t194-20020a1f2dcb000000b0040142e56d2emr6188621vkt.1.1678096773108; Mon, 06
 Mar 2023 01:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20230222121453.91915-1-nick.alcock@oracle.com> <20230222121453.91915-28-nick.alcock@oracle.com>
In-Reply-To: <20230222121453.91915-28-nick.alcock@oracle.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Mar 2023 10:59:22 +0100
Message-ID: <CAMRc=Mc76TT+y_OZokRBptgDzA=Tnf6_0BuiBNqB2FRjCEGuHg@mail.gmail.com>
Subject: Re: [PATCH 27/27] kbuild, gpio: gpio-aspeed-sgpio: remove
 MODULE_LICENSE in non-modules
To: Nick Alcock <nick.alcock@oracle.com>
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, mcgrof@kernel.org, linux-modules@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Feb 22, 2023 at 1:17=E2=80=AFPM Nick Alcock <nick.alcock@oracle.com=
> wrote:
>
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
>
> So remove it in the files in this commit, none of which can be built as
> modules.
>

Applied, thanks!

Bart
