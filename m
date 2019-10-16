Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72816D99EB
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 21:22:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46thxm5dLJzDqYB
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Oct 2019 06:22:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rdImgBV5"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46thwD2h51zDqcK
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Oct 2019 06:20:44 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x127so15323664pfb.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2019 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nkjcBI/sR0pHQa7Q6ZwYOj6wNZTv9s5BqUzK5l7ttQg=;
 b=rdImgBV5rSX819CWsaELSfHqCFtbKBlCgDcC1RDvmhUH4cxrZllIk9JJ4A3ft2cndE
 VEW0TUE7aluFb5sGutlpLF2zLOxMvSjZwYBpPZtUjPS91c1gOcqbTdlVsLDBKyZzpSWr
 N6IBsIPY8HYN5UsQs0atjxR9M+89To10Rks6ATMcWvWv8du5xxvXx79yxrzCY5rbCd6N
 X1aNnwHNB6nVARAEp7XKbKHn/2myhZkH1jy8CwLaM36qFh9YNuxoOTcz5Dz2QJBILuA3
 p93/vdRHF7+ABcOD8H8+CGE+/YqpYaOxrSkiHdYXsVxtuzBjBdn2WRPevotJpnYSBGeg
 ItaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkjcBI/sR0pHQa7Q6ZwYOj6wNZTv9s5BqUzK5l7ttQg=;
 b=CUtRsfDvojl7lUuAjYk6PDit1189/dRY9fLhgOw0UwN+SrrcoTnaKYQhrwbyhSbl2O
 yZjrRcAL4R8l2vKhXDCSPwL3jsP9oUdtp9TM8gwyhXwlz9QTEIrMsr1xvfo9FokOCiN3
 FfmQDNtU9eETMWtvUldZKO0UuyGuxG8E6GbsIsK4aUE5mD9U0UvQb/1wMfW8sew0f+w5
 8hvLGDpd8fAUyQuMWDNBL1zddQL2RI3P18ZnHatKSqsb1CgE5VzLjsMzvalsG/jeab8r
 vTWrCS7+qZ+IpzlPPDbL1jQmD1IDg+KVIcEmkkSzf2hzNrIFCC/abPlI/BLAUznkwlSy
 Un2g==
X-Gm-Message-State: APjAAAVZKnjGZkJpbAzlslfyLiwQkzOdii77tueT2MmVyJmsuvqrycy9
 PBpQYsgQueaoVCK+L5LKIHk/OdQwW9sprwTN8uIVMA==
X-Google-Smtp-Source: APXvYqwoWZoU1NQcYrpdH/oqoCAqIzIKZ/BPjYCIHumscCSMLtnNlqQsKoIXYT9B0G5ZK//ak2ZZhT8vfvalCP74+kc=
X-Received: by 2002:a17:90a:2451:: with SMTP id
 h75mr7096361pje.131.1571253639855; 
 Wed, 16 Oct 2019 12:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <49244d71-cbc3-f2ae-97ac-74b5f68a4816@fb.com>
 <4ca4083d-23ff-0475-f5fd-ec3745b440b2@linux.intel.com>
In-Reply-To: <4ca4083d-23ff-0475-f5fd-ec3745b440b2@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 16 Oct 2019 12:20:28 -0700
Message-ID: <CAFd5g47NL79YkVi4nJk63-ZbFXAKW+x1xWFoa26zPpY1+QnUrQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Wolfram Sang <wsa@the-dreams.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Oct 10, 2019 at 4:52 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> On 10/10/2019 4:29 PM, Tao Ren wrote:
> > On 10/9/19 2:20 PM, Jae Hyun Yoo wrote:
> >> In case of master pending state, it should not trigger a master
> >> command, otherwise data could be corrupted because this H/W shares
> >> the same data buffer for slave and master operations. It also means
> >> that H/W command queue handling is unreliable because of the buffer
> >> sharing issue. To fix this issue, it clears command queue if a
> >> master command is queued in pending state to use S/W solution
> >> instead of H/W command queue handling. Also, it refines restarting
> >> mechanism of the pending master command.
> >>
> >> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >
> > Tested-by: Tao Ren <taoren@fb.com>
> >
> > Tested the patch on Facebook Minipack BMC (multi-master i2c-0 environment) and
> > everything looks good to me.

Looks like we got the necessary tested-bys and reviewed-bys. Can we
apply this for next?
