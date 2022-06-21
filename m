Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8119255400C
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 03:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSQjL2jwpz3bnn
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 11:27:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k+rN15KF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=dlatypov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k+rN15KF;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSJ5x2SJJz30QW
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 06:29:40 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id cw10so6160856ejb.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Jun 2022 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GQoT4eqYGuax/64sGawgD7sMHV+BWMBDm2reCmNiO4s=;
        b=k+rN15KFxJA6a5zoP03uYyAUUFUaUXZ5WCyn4tsLzy3Z8nbqPA2uh+MFWG/ejpgZdt
         fAMPct0hVTpOk6dY1CtpVoGS48IY07+4qGc6mvZImuCQ0HO8tDZ6Dj7IFv61OUAkNmIe
         l8zutKN4eY/nZlDqTNhTr40wnq8/5PJ8i2x9UmdBmbR302lLpiTRyluuUeR/BL+pIDEN
         ZyUjQeFqRNI55hVDY6vkbqrv4tUJPgVaQYtNdLwudlwwSYOfjNKRGpN3xf8KAcxXw0VG
         Q6R82oOsuoNaALct3Wm1rVZxIYfPGRrF9gpYMV3LjU99VTUg0yc1+F0sYzxtMJU83xCY
         ySkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GQoT4eqYGuax/64sGawgD7sMHV+BWMBDm2reCmNiO4s=;
        b=YwsCDg2TPf1VqwkgKCWgNKZJ7CEc4E6gaqJhXdWeIIG2oCYXZe5qqM5uOU0aeGtATG
         kOX86/MjmK+8DvFxhyEBE1tHGAyvfXyP7V119YtzJUUxGDPxk4YNjKAqHufNHDDVP4Io
         LNEv37+JIEbmb0RbZdYyx+A14UwqmPQGk3YZqj1s4MM7z4Eap0n/ElmIl0GYKriPZd4p
         J2Ky0zuR1ssUm7ILbN456TuT89MojyScuRFgomBuyZlKSGDdhdpJNT9VdJdfrhHw5OCG
         vwYEOpxATD+3BRIycoyXcU5HnN9wGASYlPODDOm+OyfbRRSjL2+l5nXz/7L/KtvO+Ghz
         UFVw==
X-Gm-Message-State: AJIora+wYgv4CGC4M09PUtjEcqcb4LmjaQZ7zGRRoINWR76PvzyPTicr
	xBlhASFTAYxMlj2NF7LWT+mgazMUMcj5T9WL7CkMsw==
X-Google-Smtp-Source: AGRyM1v2V9388Qkgg2T6Sj1QZIN2f5LmKlNSpQwA0h9/cgUy9z29R5wk/xhzbEPKrmXmDL6wGIYNKGmqGyASlMZNlXY=
X-Received: by 2002:a17:906:c193:b0:718:d076:df7 with SMTP id
 g19-20020a170906c19300b00718d0760df7mr28234264ejz.358.1655843375835; Tue, 21
 Jun 2022 13:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220621085345.603820-1-davidgow@google.com> <20220621085345.603820-3-davidgow@google.com>
In-Reply-To: <20220621085345.603820-3-davidgow@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 21 Jun 2022 13:29:24 -0700
Message-ID: <CAGS_qxqnCvTnE-cGd-LNnhCMsz5YE3Ea9jw_OqNDwjQQ9TGpGg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] kunit: flatten kunit_suite*** to kunit_suite** in .kunit_test_suites
To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 22 Jun 2022 11:24:23 +1000
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
Cc: Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Luis Chamberlain <mcgrof@kernel.org>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, kunit-dev@googlegroups.com, Mika Westerberg <mika.westerberg@linux.intel.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, Paraschiv@google.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 21, 2022 at 1:54 AM 'David Gow' via KUnit Development
<kunit-dev@googlegroups.com> wrote:
>
> From: Daniel Latypov <dlatypov@google.com>
>
> We currently store kunit suites in the .kunit_test_suites ELF section as
> a `struct kunit_suite***` (modulo some `const`s).
> For every test file, we store a struct kunit_suite** NULL-terminated arra=
y.
>
> This adds quite a bit of complexity to the test filtering code in the
> executor.
>
> Instead, let's just make the .kunit_test_suites section contain a single
> giant array of struct kunit_suite pointers, which can then be directly
> manipulated. This array is not NULL-terminated, and so none of the test
> filtering code needs to NULL-terminate anything.
>
> Tested-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>
> Co-developed-by: David Gow <davidgow@google.com>
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>
> Changes since v1:
> https://lore.kernel.org/linux-kselftest/20220618090310.1174932-3-davidgow=
@google.com/
> - No longer NULL-terminate generated suite_sets

Nice!
Thanks for picking and cleaning this up!

Daniel
