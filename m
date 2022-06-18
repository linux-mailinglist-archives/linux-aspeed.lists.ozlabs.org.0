Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E5551235
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 10:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMlk50CKz3bbl
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 18:10:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.a=rsa-sha256 header.s=usp-google header.b=cuXb7N4G;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=usp.br (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=maira.canal@usp.br; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.a=rsa-sha256 header.s=usp-google header.b=cuXb7N4G;
	dkim-atps=neutral
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQMrx3n4yz2xgX
	for <linux-aspeed@lists.ozlabs.org>; Sun, 19 Jun 2022 03:11:42 +1000 (AEST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-101b4f9e825so4703009fac.5
        for <linux-aspeed@lists.ozlabs.org>; Sat, 18 Jun 2022 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=B8CXs8G7SKCeidkQWd9kAuICsm7Sw1h76v8hv8CR6wQ=;
        b=cuXb7N4G9pIbYvpYCa6o9PQHUD2DfcKP/+gFugpXKusIPZ8udyvtuH7DJPmo+JUAOL
         8eagpNlDgynjnq8Gd81Y/eopVQYnjECp8OsqpfuRnKA9HNyn++ZH7HNNZ9TIjsRXeSeG
         BvdjwgCJNtORrqw8bW9YNyv+ik/h87ruk6IhWF/Ulomb3roDpockEzXUsaUcJnWsLKey
         JlqmKq38sV0x3yb+kEcSWDJ7IjC7ODgIlcJzGQ3llXc0MXXhANbar/PuhU229R0QH9qT
         lz3fsVlqpE6nT/3L7c8FVrsr8AgyflhOszSQr4SlJOROtqKz5LZwEe2tkhcIJNa2UAy5
         H5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B8CXs8G7SKCeidkQWd9kAuICsm7Sw1h76v8hv8CR6wQ=;
        b=TfoexuBMg1RMDrGuoSUBj3COBWWTtWd9c6Fb3oEP8g24dF3Uy1lgxUUdTIlxvgrEeG
         Hm/6KfEqy6EQlgUvGuGDjVPudZPo3SlGNt5ZKXNGppie9DUZnsr58a38n3jrArIxcDzf
         XWseJ6pq6UiHsLBGh3BwRZZmHHZuG6uDrG09sZR3R9Ja53XSNFd7v9B55Uci4LNrXDZv
         ZSCBFCrU0bDpO8dEANvyFfzKzskRKWxipxTuc4fxnQiaqeip24yB36Slg/r9f0a7TOhu
         H56GDlG2cMg40L0sDmgl1ynzOseVvlZEZR25tR4QblYQYi3CoR6QA67FhwzQRAsL+o9j
         zy7w==
X-Gm-Message-State: AJIora8K/Jd/hIf5KqTaLMChu48rfCnXyZIzWa6w0sC0l9orbC5iWcRn
	WUU9DQpJj82UZ4trh7GR+9XQ9A==
X-Google-Smtp-Source: AGRyM1tDVmXtipYu/LaRH32Cww8VlWl/7+4pR6EaOfqHWjwGaKiJnIATqU0fJ7tQTyGNrbOvR86wqw==
X-Received: by 2002:a05:6870:538b:b0:101:17f2:d6e with SMTP id h11-20020a056870538b00b0010117f20d6emr13782917oan.200.1655572295844;
        Sat, 18 Jun 2022 10:11:35 -0700 (PDT)
Received: from ?IPV6:2804:14d:8084:84c6:fe26:c42d:aab9:fa8a? ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
        by smtp.gmail.com with ESMTPSA id o5-20020a4a2c05000000b0035eb4e5a6b3sm4677268ooo.9.2022.06.18.10.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jun 2022 10:11:35 -0700 (PDT)
Message-ID: <3358b97e-021a-82b7-9ae2-2113aea2c2d9@usp.br>
Date: Sat, 18 Jun 2022 14:11:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/5] Rework KUnit test execution in modules
Content-Language: en-US
To: David Gow <davidgow@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Daniel Latypov <dlatypov@google.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andra Paraschiv <andraprs@amazon.com>, Longpeng <longpeng2@huawei.com>
References: <20220618090310.1174932-1-davidgow@google.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
In-Reply-To: <20220618090310.1174932-1-davidgow@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 18:06:19 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 6/18/22 06:03, David Gow wrote:
> This patch series makes two changes to how KUnit test suites are stored
> and executed:
> - The .kunit_test_suites section is now used for tests in modules (in
>   lieu of a module_init funciton), as well as for built-in tests. The
>   module loader will now trigger test execution. This frees up the
>   module_init function for other uses.
> - Instead of storing an array of arrays of suites, have the
>   kunit_test_suite() and kunit_test_suites() macros append to one global
>   (or per-module) list of test suites. This removes a needless layer of
>   indirection.
> 
> The upshot of this is that it should now be possible to use the
> kunit_test_suite() and kunit_test_suites() macros to register test
> suites even from within modules which otherwise had module_init
> functions. This was proving to be quite a common issue, resulting in
> several modules calling into KUnit's private suite execution functions
> to run their tests (often introducing incompatibilities with the KUnit
> tooling).
> 
> This series also fixes the thunderbolt, nitro_enclaves, and
> sdhci-of-aspeed tests to use kunit_test_suite() now that it works.
> 
> Huge thanks to Jeremy Kerr, who designed and implemented the module
> loader changes, and to Daniel Latypov for pushing the simplification of
> the nested arrays in .kunit_test_suites.
> 
> I've tested this series both with builtin tests, and with modules on
> x86_64, but there's always the possibility that there's something subtle
> and nasty on another architecture, so please test!
> 
> Cheers,
> -- David
> 

I've tested the modules on x86_64 machines, and everything looks fine.
Also, I applied the AMDGPU KUnit tests [1] on top of these patches,
tried out compiling as a module, and it runs pretty well!

Great to see this feature on KUnit!

Tested-by: Maíra Canal <maira.canal@usp.br>

[1] https://lore.kernel.org/dri-devel/20220608010709.272962-1
maira.canal@usp.br/

Best Regards,
- Maíra Canal
