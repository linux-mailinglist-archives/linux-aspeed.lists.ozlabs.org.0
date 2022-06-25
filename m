Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A055A71F
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Jun 2022 07:10:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVMWw1x0jz3cfM
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Jun 2022 15:10:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EqD8y2+a;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3z5i2yggkdpybytgbemuemmejc.amkjglsv-yqnccbjgqrq.mxjyzq.mpe@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EqD8y2+a;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVMWm4dyHz3c87
	for <linux-aspeed@lists.ozlabs.org>; Sat, 25 Jun 2022 15:10:43 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id b7-20020a251b07000000b0066c8f97b0f9so73072ybb.23
        for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 22:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=w4sImYlkO8ijtHtHqXjuNpZj0tKuVZDrJNUstUmHo0Y=;
        b=EqD8y2+aOVUkTGcq5ZUmSJSlcNdi0/42WaEgggkl5B3OgbsWkhjLvSidKJ/JJ0Ii8D
         n5a4Jh42vH8vTZ+mrg+TgQiYpMZMV5Wwr7Ontt6SKvDFTSV2uVH5HifBJwaRiN+Mta7o
         R5UWn0iyCaAL68/7Educg/KLDyigRQWkyUnoluYUe7nfxYLaByKZUDwGF46yZEtAKhbG
         8UsVYqpRwR/p+mL+pPSwt9lVlTi4ocx+NI0DRkaxQZ5aSTH7oaa9h7Btr1uOipe43x6N
         IqIiTq7UsvFiUg2NM3r57zmp1YW3HI30VyzT2gakok84AaaSUhD3aDEahzIZwKyBUfhd
         4f/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=w4sImYlkO8ijtHtHqXjuNpZj0tKuVZDrJNUstUmHo0Y=;
        b=S28NiAbbkqOMFR0B04Cx1aYn1Iuj0U0+IV5341itlF2LN6aEnXYQDdedZH3btNIN4J
         0OaKoDKJfqOwSpnqJGD1hnCbUg3fv5JmfzxxJkAOwre5A3mBZO5/SPa8/2SDM1B/WF1n
         i71SQbzUXUT9Vbbob/oiOWeNwj8JCuiytR6oLYQnh9aIhCNJhgMvU7FV7RsnbguZk/CF
         Jb6AFPn0fYqFPjh+LGkfhZGri8W3wR/NoU3ctZkwn9MwV0qd6ma4xIDIaj2SzCfIW9wl
         KHX+ku1JutGS1l4wOi0/pPPmaJ5xhEz15hNt2QnPP4uLI3oeSIBksSoSC9WRBVsSEGOa
         V3dQ==
X-Gm-Message-State: AJIora/c6zNFnALEMz1dSmZoxpvxHFgFWGrLxJ+P8ihsoGLl1VBrrc6C
	MZ7nIvxDXnfbItsGgNCXBFBo8kFtK5w7GQ==
X-Google-Smtp-Source: AGRyM1un+sBPc/7wBD+YQSQ7XAND66LYZk9RBj7rFNjc67YShu92PiqgyBy4jeaAtiwe0X78yPXPHI8EK15Tmw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a81:7cd6:0:b0:317:b6a2:6f15 with SMTP id
 x205-20020a817cd6000000b00317b6a26f15mr2708816ywc.234.1656133839830; Fri, 24
 Jun 2022 22:10:39 -0700 (PDT)
Date: Sat, 25 Jun 2022 13:08:34 +0800
Message-Id: <20220625050838.1618469-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 0/5] Rework KUnit test execution in modules
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andra Paraschiv <andraprs@amazon.com>, 
	Longpeng <longpeng2@huawei.com>, Greg KH <gregkh@linuxfoundation.org>
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
  indirection, and removes the need to NULL-terminate suite_sets.

The upshot of this is that it should now be possible to use the
kunit_test_suite() and kunit_test_suites() macros to register test
suites even from within modules which otherwise had module_init
functions. This was proving to be quite a common issue, resulting in
several modules calling into KUnit's private suite execution functions
to run their tests (often introducing incompatibilities with the KUnit
tooling).

This series also fixes the thunderbolt, nitro_enclaves, and
sdhci-of-aspeed tests to use kunit_test_suite() now that it works. This
is required, as otherwise the first two patches may break these tests
entirely.

Huge thanks to Jeremy Kerr, who designed and implemented the module
loader changes, and to Daniel Latypov for pushing the simplification of
the nested arrays in .kunit_test_suites.

I've tested this series both with builtin tests on a number of
architectures, and with modules on x86_64, and it seems good-to-go to
me. More testing (particularly of modules) with more interesting setups
never hurts, though!

Cheers,
-- David

Changes since v2:
https://lore.kernel.org/linux-kselftest/20220621085345.603820-1-davidgow@google.com/
- Add various Reviewed-by and Acked-by tags.
- Fix the Kconfig for thunderbolt to not allow USB4=y and KUNIT=m with
  tests enabled.
- Clean up the sdhci-of-aspeed init a bit more (Thanks Daniel)

Changes since v1:
https://lore.kernel.org/linux-kselftest/20220618090310.1174932-1-davidgow@google.com/
- Fix a compile issue when CONFIG_KUNIT=m (Thanks Christophe)
- No longer NULL-terminate suite_sets.
- Move the thunderbird Kconfig to the correct patch (Thanks Andra)
- Add all the Tested-by and Acked-by tags.

---
Daniel Latypov (1):

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
 drivers/mmc/host/sdhci-of-aspeed.c            |  34 +----
 drivers/thunderbolt/Kconfig                   |   6 +-
 drivers/thunderbolt/domain.c                  |   3 -
 drivers/thunderbolt/tb.h                      |   8 -
 drivers/thunderbolt/test.c                    |  12 +-
 drivers/virt/nitro_enclaves/Kconfig           |   5 +-
 drivers/virt/nitro_enclaves/ne_misc_dev.c     |  27 ----
 .../virt/nitro_enclaves/ne_misc_dev_test.c    |   5 +-
 include/kunit/test.h                          |  60 ++------
 include/linux/module.h                        |   5 +
 kernel/module/main.c                          |   6 +
 lib/kunit/executor.c                          | 115 ++++----------
 lib/kunit/executor_test.c                     | 144 +++++-------------
 lib/kunit/test.c                              |  54 ++++++-
 16 files changed, 154 insertions(+), 343 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

