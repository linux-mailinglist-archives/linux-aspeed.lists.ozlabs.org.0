Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BBC56BEBA
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Jul 2022 20:23:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfhVX6DJMz3c2c
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Jul 2022 04:23:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dm7gPCV+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=dlatypov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dm7gPCV+;
	dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfhVQ6vNMz3byt
	for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Jul 2022 04:23:25 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id p128so20452866iof.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 08 Jul 2022 11:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97VK5iQW+OLAMctb3bRhnVJI2Dk4NFeFeJbQXMmdP9g=;
        b=dm7gPCV+4gyiVAxSxrFBQejGH77CCYpAJBElNtgCngEA5WBI7Yc2n3yywfIFlpcCQd
         78g5turygqj6DdxWi3846rwYQBQlX8o9NVT3W8VVAhJUOgBlNd71vpPAVU7MkPRWnoyV
         mxwci8zjQG/h2zn69Vyv0HFfD7p0oOaFdBVmG/CeXp4vKGkaOR8ntd+QkwJKIvtSKtA3
         iDWXSAT7vQ0X1EGvbKQyqsp55ZEhSbF8lpjPQDRJ7aqB5JL0JpaM/9HcziOkPjuENTsi
         +vuwgM7BUKnDpoiNFCqHK6QcJ8qeVKH6wEXSEvf67S6wPwYcKKbL7mxAZlb01woQqmE6
         XTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97VK5iQW+OLAMctb3bRhnVJI2Dk4NFeFeJbQXMmdP9g=;
        b=FKniZKG7Ajo+9129oPADJcjOwoCSGxddxA7vcSF0xZx1FxwDCgFLxWFvhy6pw2gsX3
         l4XhJwS46Vs4/aQYEo28pDISnr1DdpbHBKRJDRqS8wAHw80QtrjVFWpGUqFN2rLWtwnn
         BhQhGd2VpxiaWJe+yIKXtJ5DV5UX8C0lYkIGqDSqWWQ4YrolZ5/xWVT4LtL6JcdRra4g
         Es2l35cbTIXqSO3Vq7BNfWYICVXNgpwFmtUrZrv7GCn2BzdipF112Y38f9rerVKTuHfJ
         Q25cnELRhN+YpTwsC4dJq5ykD39noatSEQlxbFLqPZwwZ9R3yUdtX1w2J6g0RXn01UZS
         LkhQ==
X-Gm-Message-State: AJIora+4o1C7AFuVi5E313QvFfZaXuIC3MKgkLKuBdr3czVeVdOfzvAn
	+LwKtm6luIm9oPbTR2nZwYs46hLXz6tcPtWcGKgo6Q==
X-Google-Smtp-Source: AGRyM1v951IbthTm0LElBbaQF/7RITAtzDe990vOEfJILkJ06LZs6GkFPaKHhzsiSy2JTGmWeVbLwI83+m4nwKm1Q7M=
X-Received: by 2002:a02:a105:0:b0:33f:1909:6c82 with SMTP id
 f5-20020a02a105000000b0033f19096c82mr2997602jag.278.1657304599260; Fri, 08
 Jul 2022 11:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com> <20220625050838.1618469-2-davidgow@google.com>
In-Reply-To: <20220625050838.1618469-2-davidgow@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Fri, 8 Jul 2022 11:23:08 -0700
Message-ID: <CAGS_qxrGwVL37AOUWCxwx=qg6YvXCDSSu4p_PSt7_87N3RxJZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] kunit: unify module and builtin suite definitions
To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, Greg KH <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, Luis Chamberlain <mcgrof@kernel.org>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jun 24, 2022 at 10:10 PM David Gow <davidgow@google.com> wrote:
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 8ffcd7de9607..54306271cfbf 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -250,41 +250,8 @@ static inline int kunit_run_all_tests(void)
>  }
>  #endif /* IS_BUILTIN(CONFIG_KUNIT) */
>
> -#ifdef MODULE
> -/**
> - * kunit_test_suites_for_module() - used to register one or more
> - *                      &struct kunit_suite with KUnit.
> - *
> - * @__suites: a statically allocated list of &struct kunit_suite.
> - *
> - * Registers @__suites with the test framework. See &struct kunit_suite for
> - * more information.
> - *
> - * If a test suite is built-in, module_init() gets translated into
> - * an initcall which we don't want as the idea is that for builtins
> - * the executor will manage execution.  So ensure we do not define
> - * module_{init|exit} functions for the builtin case when registering
> - * suites via kunit_test_suites() below.
> - */
> -#define kunit_test_suites_for_module(__suites)                         \

Deleting this bit now causes merge conflicts with Shuah's kunit
branch, due to https://patchwork.kernel.org/project/linux-kselftest/patch/20220702040959.3232874-3-davidgow@google.com/
I.e. We added in a MODULE_INFO(test, "Y") in this to-be-deleted section.

Perhaps something like this would be a fix?

  #ifdef MODULE
  #define _kunit_mark_test_module MODULE_INFO(test, "Y")
  #else
  #define _kunit_mark_test_module
  #endif /* MODULE */

  #define __kunit_test_suites(unique_array, unique_suites, ...)
          \
          _kunit_mark_test_module;
          \
          static struct kunit_suite *unique_array[] = { __VA_ARGS__,
NULL };     \
          static struct kunit_suite **unique_suites
          \
          __used __section(".kunit_test_suites") = unique_array


> -       static int __init kunit_test_suites_init(void)                  \
> -       {                                                               \
> -               return __kunit_test_suites_init(__suites);              \
> -       }                                                               \
> -       module_init(kunit_test_suites_init);                            \
> -                                                                       \
> -       static void __exit kunit_test_suites_exit(void)                 \
> -       {                                                               \
> -               return __kunit_test_suites_exit(__suites);              \
> -       }                                                               \
> -       module_exit(kunit_test_suites_exit)
> -#else
> -#define kunit_test_suites_for_module(__suites)
> -#endif /* MODULE */
> -
>  #define __kunit_test_suites(unique_array, unique_suites, ...)                 \
>         static struct kunit_suite *unique_array[] = { __VA_ARGS__, NULL };     \
> -       kunit_test_suites_for_module(unique_array);                            \
>         static struct kunit_suite **unique_suites                              \
>         __used __section(".kunit_test_suites") = unique_array
>
