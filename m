Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC38B7989
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2024 16:31:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ISbU+vay;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTN0m63Yhz3cS0
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 00:31:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ISbU+vay;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTN0g5ZBNz2xqq
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 00:30:58 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2df848f9325so45298101fa.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2024 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714487454; x=1715092254; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEOadgbQT3YL3EGb5PWaYHsAq47K4P1J7w8JkzUt/l0=;
        b=ISbU+vay26ofK9sf5q+MXTeKa92gYqEYcUPV/TsYBIOx56tD+zxUk7oTYrMNLIn8QM
         aJcJ4nLq4O8CxdIi8FJyg2urH6O15RxNZlt8u2DvRokAcqBEsqUTJzWxS/ouGV0HyqaX
         5AmC2j/EOvpUjndZbM0T5ig5CCqyaMza0c3Ge41oSTLaAwigsS7XwCzpycmThJUz2m6Y
         a+5skFVLO2WLgPMoEA5lvwvTz7Xov7L7u+RLG0AFvzq0KUpy1s1M5TFNdYyXNmb+2HKu
         0ZVS3DOgveK0ZmWi2sTIDeN8w9PYFnGFcehsZLoAivndj0oQx1yLnSBRHApHYUivPDmS
         FirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714487454; x=1715092254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEOadgbQT3YL3EGb5PWaYHsAq47K4P1J7w8JkzUt/l0=;
        b=Yppmey24xFI7LoXoWAY3scXSiXiuOlSvbj3Q7XOlmdWAHCGqv03OS/cXQvMToZi2KV
         3vRwn1ksHJGm/yUAFdqVqZ9lA3jCGuPRe+JohgfA0nKd8FCjCp5BgRWThDhGpRDPGCwp
         ApwPLEHnI6p4sYv0ftl2QAEYtZMIYet/VQBBLnZT8wYdHUzmbpNfFcNSv7Obcg8RTdD9
         C0yQELaA42ZGO6TpJvNmjpokijprnObtFZwhwQYw2A1Wd1gt1ln6Inn1u1h38/uv/cmE
         QA63V/FwLMrsA8+iB5uTQAzpIVN5xLoKZ9iiVHRgyp35DvCqyXry0zc6C/er2+bowvna
         p9tw==
X-Forwarded-Encrypted: i=1; AJvYcCUYKtp7kNoJ9G84lAJ+1ZSqDK3yg7iQUp7CCjWZKFz7ffsA/XJ2MhdZzJ7wp+E7Qw+GAyigyWM9EKQIwe7KucWrPxGv/pjjBIllXfNvOg==
X-Gm-Message-State: AOJu0Yx55+NnwjkOQAK50wKZXrRktE3xTmDccwG7TG8CIIS46rrxQB49
	31H589Nw6e/1UmJrpz5dear64pYQHrx0CMuxSj8O57cZu9IZ1I4oNLamyQNM4woeOwqZf9rGieq
	iA00woTfMbIOsoxFmdZpzw3/jGI4=
X-Google-Smtp-Source: AGHT+IGjOrb4BHOISLk99QfwZ1zS8Uq99QSSFpGq0P8HcPecTZ6qZzCz7vA6fnsaQ871JWWvDVySYkqIhti1ybrIaV8=
X-Received: by 2002:a2e:9b0f:0:b0:2df:e2d1:f4b5 with SMTP id
 u15-20020a2e9b0f000000b002dfe2d1f4b5mr6985340lji.21.1714487454257; Tue, 30
 Apr 2024 07:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240428142937.785925-1-peteryin.openbmc@gmail.com>
 <20240428142937.785925-2-peteryin.openbmc@gmail.com> <d231737bfa9f3dd3c0a4370ab2e86557a407980d.camel@codeconstruct.com.au>
 <CAPSyxFRG8mooBg1QWZk8sw=cWzoUQqk=WnyAtgPfRBmQRKtvaQ@mail.gmail.com> <e694ba58197687dce68d568dfcb078ff3a6c6fed.camel@codeconstruct.com.au>
In-Reply-To: <e694ba58197687dce68d568dfcb078ff3a6c6fed.camel@codeconstruct.com.au>
From: Peter Yin <peteryin.openbmc@gmail.com>
Date: Tue, 30 Apr 2024 22:30:43 +0800
Message-ID: <CAPSyxFSVkyKQ2xvg92xqpkL=0WYqt+rP_+TjcM19mEMtu4FPng@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] drivers: watchdog: revise watchdog bootstatus
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andrew,
  Thanks, I am going to fix it in V9.

On Tue, Apr 30, 2024 at 9:38=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2024-04-29 at 22:54 +0800, Peter Yin wrote:
> > Hi Andrew,
> >     I am not sure how to add the Fixes tag, Is it like this?
> >
> > Fixes: 6a6c7b006e5c (watchdog: aspeed: Add support for
> > aspeed,reset-mask DT property).
>
> Approximately, yes, but it must not be wrapped.
>
> Some more info is provided in the submitting-patches documentation:
>
> https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges
>
> > Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> >
> > Is it the correct commit ID or should I base on which commit ID?
> >
>
> The correct commit ID to use is the one that introduces the problem.
> Using `git blame drivers/watchdog/aspeed_wdt.c` it appears you're
> changing the behaviour that was introduced in 49d4d277ca54 ("aspeed:
> watchdog: Set bootstatus during probe"):
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D49d4d277ca54e04170d39484c8758a0ea9bca37d
>
> Andrew
