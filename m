Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161FD031E
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 23:54:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nrjf4JfkzDqR3
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:54:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jMmx7myY"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nrjY4HGjzDqL0
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2019 08:54:39 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id q7so4958pgi.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2019 14:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V1+lJqves7ucGJOP/Nkkia3hCPKmcD+/qXX6Owgsp9Y=;
 b=jMmx7myYY7/SnDMBF8ju9UVZHQALm1OwuJ9FChPOq4Vb5YNwgNbqblnumipDlA8sjC
 VGxSI8MJw/wpOZPJQZkPHmIyJDMn/TSZJtD+wNPpzwTk6igGcgC3hIT07DU+et0T0WqQ
 04ICCnAMSPH0bl5+rnoko5GsX0p1DAp1cfNL35R6fxEzfubIjCmks/djSOWtu5QoIt/n
 t4xz9B2AtHRU0akas7NOwuBhOV18XnXAVZlaUD9/ejc+sbksFKfgnbh6rNc3KtFI0g3o
 LVOr/Y3v4esmPZO2zxJSqsGAu3JSs0X7eFKgyjXRVq7sp1olZi2RdOGJ9kr0/oT17cPX
 37nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1+lJqves7ucGJOP/Nkkia3hCPKmcD+/qXX6Owgsp9Y=;
 b=Wq5mRJOdMhMnouIIH+xPYkhPu7nUbrRnFCmjBWTHoTWYe7bdmjF9VcFK40nStDW5Gd
 gKSNuGk18KgjD6IYtFZqeprCVVm6l6nGmO/JHfx9Atkdzohp/vbO6PWtrbczufOJbkGX
 yXD6FoN9KApfCgQdFobst8hD8MSzoNuywQM8nwZ/ca573TVVy6yGzzrtnWFrocb7e2/5
 CY61a0toElBzOm4PBNrouGaxDYYr8H9zMg0kqm/QSFRRAHQ9U8vkNjqbnW++QvzPCpG0
 FT46AUggi0gUBv9uGFbeYjpz8TKl6Q12x8B5WkuhkhwaAMdtaJOL5E7f1xXYjT7YpmG8
 Q2eA==
X-Gm-Message-State: APjAAAUxKPY/qQCOoC5369IYtdTnZD2bNViDr7OPuJuxyS1tIn3O7wyb
 HtG43U/uNUGQBYJ70QniaMMQa5axJBcixXWAUOrJtg==
X-Google-Smtp-Source: APXvYqwhkBSeIrfZPsL7ZK9LW5v5HqGqG3I9HK6n3n5INpZAPcE00GaqUqIyBYMJT+42oLmz1YYH0DQmqXq2qu0HNgI=
X-Received: by 2002:a62:3387:: with SMTP id z129mr89443pfz.185.1570571674841; 
 Tue, 08 Oct 2019 14:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
 <20191008203157.GA184092@google.com>
 <ac256b3f-2a06-6fa5-72ab-d8f8014d253e@linux.intel.com>
In-Reply-To: <ac256b3f-2a06-6fa5-72ab-d8f8014d253e@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 8 Oct 2019 14:54:23 -0700
Message-ID: <CAFd5g47vLN6NyZR73+EqOqfOPnM7CkGGsCwEn3udnJt99d8KCg@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>,
 Wolfram Sang <wsa@the-dreams.de>
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
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 8, 2019 at 2:13 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> On 10/8/2019 1:31 PM, Brendan Higgins wrote:
> > On Mon, Oct 07, 2019 at 04:13:11PM -0700, Jae Hyun Yoo wrote:
> >> In case of master pending state, it should not trigger the master
> >> command because this H/W is sharing the same data buffer for slave
> >> and master operations, so this commit fixes the issue with making
> >> the master command triggering happen when the state goes to active
> >> state.
> >
> > nit: Makes sense, but can you explain what might happen without your
> > change?
>
> If we don't use this fix, a master command could corrupt data in the
> shared buffer if H/W is still on processing slave operation at the
> timing.

Right, can you add that to the commit message?

Is this trivially reproducible? We might want to submit this
separately as a bugfix.

Actually yeah, can you send this separately as a bugfix? I think we
might want to include this in 5.4.

Wolfram and Joel, what do you think?
