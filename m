Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112D56C646
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Jul 2022 05:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfwQT3nHZz3c6C
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Jul 2022 13:20:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=msMkA6mM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=35vpiyggkda8spaxsv3bv33v0t.r310x29c-p74tts0x787.3e0pq7.36v@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=msMkA6mM;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfwPm2Bd9z3byt
	for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Jul 2022 13:20:10 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id k18-20020a25fe12000000b0066e21b72767so365882ybe.5
        for <linux-aspeed@lists.ozlabs.org>; Fri, 08 Jul 2022 20:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=+6mxQwenuketJNKTw2AgKFfZAqlF6au6yl4FTcttxec=;
        b=msMkA6mMPXw2DPMUq74vBSihilJyTAYJuh/S0rF3IC0cPUdu0AeobvaBuBjtiEaNII
         NOmrLvdaC1siW8gfkU3VdyX8XWubTcJ7N8ejX2AMWIS5YBFys+TvqXBYHaVHSNltPLp6
         CM75KN3k6KbthTszveXONoTcH1G34XiQSURviEVH+ZIXVpH3TnRoS7XDEp/Qr0A2GlZA
         HkmtaJ6ydDOGq7aPzND/i9cUqwLgaFgrR2XFBj59P6jnvpTM44S4ioqga7l/HAa/G62h
         9QLhIfp9lXOjBKlQtkjDngTTNxcgLxNwQGMEnAZiyi+8f0Xv4XD9xt1Y25zBorh7w2vw
         qFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=+6mxQwenuketJNKTw2AgKFfZAqlF6au6yl4FTcttxec=;
        b=PWofcdGw+Tv8HvBMf+m+tLQnMGLOEzU71gQtICk/kbmi1gpDXNJkL3So9Gh071kG9b
         LTJtVQLsAwnRS7C4PKfk2henBOn8qq14XSv2EDAFJ0mOdZQJc98RA9bu+p0OFzBSCD+H
         9G3Am3LVa0UHjB87Ys2nXoNpKggdLZQ9xphdmQ+PTMSiRFtlFVtemC0HZ0opaeSPloSp
         CMVoSWgfAN5awUPSUF9pHWuYxTa86OK8Do/wjYxaSRB3IscqXdjq147W09qPQdsayQOM
         CsYcYoKNwamHnYFKELy+XIq7wLf7ssP7ILGFpIPpDyJwm50VikI4MZFVPzkQsWzuPzv0
         nb3A==
X-Gm-Message-State: AJIora+5rzHz49MJqply8OcXccyohDCkS0Q3zOOiW8fG48mxrXTHoO3M
	FiQnb4ucaV2C/pGb93DOe3defSyJtZxi7g==
X-Google-Smtp-Source: AGRyM1tgsnBX7aPla1Mr0qumw/V3OTEIp6cC1PNLFxa8hu9gpm9EJthrRffSNiaj4BlnO6ehELCNCbFGypYSnw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:13c6:0:b0:669:33b:97cb with SMTP id
 189-20020a2513c6000000b00669033b97cbmr6543203ybt.583.1657336806987; Fri, 08
 Jul 2022 20:20:06 -0700 (PDT)
Date: Sat,  9 Jul 2022 11:19:56 +0800
Message-Id: <20220709032001.819487-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v4 0/5] Rework KUnit test execution in modules
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

Changes since v3:
https://lore.kernel.org/linux-kselftest/20220625050838.1618469-1-davidgow@google.com/
- Rebase on top of the TAINT_TEST patch series. This should now apply
  cleanly on top of the kunit branch:
  https://lore.kernel.org/linux-kselftest/20220708044847.531566-1-davidgow@google.com/T/#u
- Add Brendan's Reviewed/Acked-by tags.

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
 include/kunit/test.h                          |  62 ++------
 include/linux/module.h                        |   5 +
 kernel/module/main.c                          |   6 +
 lib/kunit/executor.c                          | 115 ++++----------
 lib/kunit/executor_test.c                     | 144 +++++-------------
 lib/kunit/test.c                              |  54 ++++++-
 16 files changed, 155 insertions(+), 344 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

