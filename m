Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5BD550394
	for <lists+linux-aspeed@lfdr.de>; Sat, 18 Jun 2022 11:04:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ92L6h3Nz3bqv
	for <lists+linux-aspeed@lfdr.de>; Sat, 18 Jun 2022 19:04:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UIxQ5FEc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=34pstyggkdn0c9uhcfnvfnnfkd.bnlkhmtw-9roddckhrsr.nyk9ar.nqf@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UIxQ5FEc;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQ91h6ggwz3bYk
	for <linux-aspeed@lists.ozlabs.org>; Sat, 18 Jun 2022 19:03:35 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id mh12-20020a17090b4acc00b001e32eb45751so4183247pjb.9
        for <linux-aspeed@lists.ozlabs.org>; Sat, 18 Jun 2022 02:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ptVKPuGcbB2+la+8ZiODjieQiW7k/oxo/Oz/EdgWumA=;
        b=UIxQ5FEc5KUGjUFI0jmR+pzVeOpPYkxsewDr7QpplKnl9i8FqbhtassrfzcyyW/VG4
         q4zTZ1jlJegFa1PmQn4JCa7rgZpA9GXdHeGc7DZThZ3KQpZ5ijja2/D22gi939kN75as
         w19ZMHfgy7cHjfLdCoqYjwhPvt3gyoPZQIRTlpXEuBVi1hRUi93DrwXHyRyr6uPntB+C
         f5qLDoDNzx+/aL9DTUn2OsNZ3Fo0QayufVMnNZ/CwjjPTMgirdUroVvDRqUjhR2FhpvJ
         nwHs/ieBLMWCoE89Zwm+PIiFZpaoTHinYCTLH2LFGLCAwEinnlsS9UG+rWKeGDt9sn12
         wlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ptVKPuGcbB2+la+8ZiODjieQiW7k/oxo/Oz/EdgWumA=;
        b=AqSTef3Ga3rGcU0A3c7rav1mhypado+zKGP8yvx+MohcXmGu0KzOKh13hfxs9X533+
         cAr1Yo9A/E8KrKjDnE2gOY68r/RNh2FLJgEIgyWad3qUoe3d1DSWI8s9bw0qlUrXRXX9
         dGHExJjdPwDWW71TmTr71YpVzOd5fEBLCtb+CrEVUp01fPG0tyQXcKkfN9hkrvWvACSH
         nPhNguY11R8x61ki7AXeUL1yzzBobtWRGg6HquIQ6JGO8gct7aLTVDr92m+Xy3qmqTBg
         2OHR2Q0AeYmbhyLCeXrNEbOJYKTO24geMNef8H7HP6HZrqDv+gVnwZXOUR8vIoB7PFPS
         53ug==
X-Gm-Message-State: AJIora+Yw1ykuL+5arOvG/5mAEbm6BJk5mrlzCD3cGJSIrehvgrdPerL
	xYPxkFfHT1lRTrR9nEJtzHGptefUc//DOg==
X-Google-Smtp-Source: AGRyM1sH2PfcGj8ViDV0lllmFpU71ukSxzCtMA3vIatOWbHB6KvOeV6QomY8XXQV6nt0d4lCuh4I6QRng8JeMg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:903:11cc:b0:168:eae:da4a with SMTP id
 q12-20020a17090311cc00b001680eaeda4amr13290211plh.21.1655543010775; Sat, 18
 Jun 2022 02:03:30 -0700 (PDT)
Date: Sat, 18 Jun 2022 17:03:05 +0800
Message-Id: <20220618090310.1174932-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 0/5] Rework KUnit test execution in modules
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andra Paraschiv <andraprs@amazon.com>, 
	Longpeng <longpeng2@huawei.com>
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
Cc: David Gow <davidgow@google.com>, linux-aspeed@lists.ozlabs.org, =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch series makes two changes to how KUnit test suites are stored
and executed:
- The .kunit_test_suites section is now used for tests in modules (in
  lieu of a module_init funciton), as well as for built-in tests. The
  module loader will now trigger test execution. This frees up the
  module_init function for other uses.
- Instead of storing an array of arrays of suites, have the
  kunit_test_suite() and kunit_test_suites() macros append to one global
  (or per-module) list of test suites. This removes a needless layer of
  indirection.

The upshot of this is that it should now be possible to use the
kunit_test_suite() and kunit_test_suites() macros to register test
suites even from within modules which otherwise had module_init
functions. This was proving to be quite a common issue, resulting in
several modules calling into KUnit's private suite execution functions
to run their tests (often introducing incompatibilities with the KUnit
tooling).

This series also fixes the thunderbolt, nitro_enclaves, and
sdhci-of-aspeed tests to use kunit_test_suite() now that it works.

Huge thanks to Jeremy Kerr, who designed and implemented the module
loader changes, and to Daniel Latypov for pushing the simplification of
the nested arrays in .kunit_test_suites.

I've tested this series both with builtin tests, and with modules on
x86_64, but there's always the possibility that there's something subtle
and nasty on another architecture, so please test!

Cheers,
-- David

Daniel Latypov (1):
  kunit: flatten kunit_suite*** to kunit_suite** in .kunit_test_suites

David Gow (3):
  thunderbolt: test: Use kunit_test_suite() macro
  nitro_enclaves: test: Use kunit_test_suite() macro
  mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro

Jeremy Kerr (1):
  kunit: unify module and builtin suite definitions

 drivers/mmc/host/Kconfig                      |   5 +-
 drivers/mmc/host/sdhci-of-aspeed-test.c       |   8 +-
 drivers/mmc/host/sdhci-of-aspeed.c            |  27 ----
 drivers/thunderbolt/Kconfig                   |   5 +-
 drivers/thunderbolt/domain.c                  |   3 -
 drivers/thunderbolt/tb.h                      |   8 -
 drivers/thunderbolt/test.c                    |  12 +-
 drivers/virt/nitro_enclaves/Kconfig           |   5 +-
 drivers/virt/nitro_enclaves/ne_misc_dev.c     |  27 ----
 .../virt/nitro_enclaves/ne_misc_dev_test.c    |   5 +-
 include/kunit/test.h                          |  60 ++------
 include/linux/module.h                        |   5 +
 kernel/module/main.c                          |   6 +
 lib/kunit/executor.c                          | 117 ++++-----------
 lib/kunit/executor_test.c                     | 139 +++++-------------
 lib/kunit/test.c                              |  54 ++++++-
 16 files changed, 152 insertions(+), 334 deletions(-)

-- 
2.36.1.476.g0c4daa206d-goog

