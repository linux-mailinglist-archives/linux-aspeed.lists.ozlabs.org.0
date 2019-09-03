Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0F2A7140
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 19:00:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NCrY5X7zzDqHR
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 03:00:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.174; helo=mail-qk1-f174.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NCqn30QqzDqRt
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 03:00:05 +1000 (AEST)
Received: by mail-qk1-f174.google.com with SMTP id x134so6507242qkb.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 10:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/EIw5WazqKui2YXvUOfv2iXk4WiZVo1bTFmwWu2jynQ=;
 b=obs90JD7+3/sMLOpGMyN2Jzs/QejAGcXi/cYPtA1dTcdGmRjsHAzncn6uJZKo7q2AL
 D1viIIztfe7YNKnGFjayb04zbcxnn+9FPuVJDJIOm4GlxQHH1jG7ws5+5SY1GTcvDBZx
 HFlQ20axp4w3WyQYFfnZ8kEkpLpUEZveiECM4rJAbAsGLPUsauBHRfaSBT+ZIlbt00bW
 ib+ZEjE+Qo8tL6vwGTe7g21T7w9IMt/GZ0/j9+6P0eCqPm57W8yUtUujDTY3DXXaN5/y
 sF0qPpBIk+2lneTzq4pZgrBoxBYNJwDr1Q3rKHl+8VJYcg4ZgRntdBYjSw/EhYPQtA4T
 K0BA==
X-Gm-Message-State: APjAAAW3sbCejCvxQMDcChwr0fqEPo7IX8z7nKLqML3s0MS4jCFzI3z0
 AzExztE2eitYtaE+WhBdnLijf17uldKqTa9GjkA=
X-Google-Smtp-Source: APXvYqziGEPSJ8G/14gxBqljp3tsVXAARn0AGCViZc2v8JUqVDPhRDcs5SfzGsSpJsF7N3YmJnvGV4hZs9+BeKaMCes=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr34369601qka.3.1567530002245; 
 Tue, 03 Sep 2019 10:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdyWzghA0QPDzA_MK5FYwhT5afqDJHNdhc8mfD2uk8MfQ@mail.gmail.com>
In-Reply-To: <CACPK8XdyWzghA0QPDzA_MK5FYwhT5afqDJHNdhc8mfD2uk8MfQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 Sep 2019 18:59:46 +0200
Message-ID: <CAK8P3a3zL1oi3dSy4w8DB1v=O_42mEE243y_-0ScV=v=LOmaGA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: defconfig changes for 5.4
To: Joel Stanley <joel@jms.id.au>
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
Cc: SoC Team <soc@kernel.org>, arm <arm@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Aug 25, 2019 at 4:10 PM Joel Stanley <joel@jms.id.au> wrote:
> ----------------------------------------------------------------
> ASPEED defconfig updates for 5.4
>
>  - Enable the new AST2600 in multi_v7 and the aspeed_g5 configs.
>
>  - Regenerate defconfigs to drop old options
>
>  - Clean up network options

Pulled into arm/defconfig, thanks!

      Arnd
