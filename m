Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCBE11FE4D
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 07:01:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47brJ168ddzDqTh
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 17:01:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="b6X1jWpT"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47brHp0PlgzDqSS
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Dec 2019 17:01:25 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id g17so3644227qtp.11
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Dec 2019 22:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f2z51NNQPGTMFGtesof0cLcp5BmT40GR+s1mJAxOa+c=;
 b=b6X1jWpTP0RfxR0H/2AEWnknIbaWzzhiV6iFVLwl6X9CxbOBNzjE5GUcxjZ7hJEUAn
 Zc7OU2vHnDk1a726t9a0s/+ZZTMU1TeZTPhtju7Oi59MiMONTQOtK7D7BoAGFq/3OI0q
 8RTFbo/jAklEfgL4DoCUxqRT6V9fIOgVreE/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f2z51NNQPGTMFGtesof0cLcp5BmT40GR+s1mJAxOa+c=;
 b=jwzoFB8zHdOro8V+Q6wf3U/X10Tvfv6GVvmaq+OOmmOxqE1lzGG9XfvUUVdBJBkQiL
 VBbGMF6GsOlSlPm4PvADxoTW9oMiw0yx8MbLkDNJFtW9s2KK3ygkQJbNo96ZrRIpxcsK
 AHLl0cxSgqxqjcyGg/A+49yrEgufkBqa0Es8Lj9LJA+ym0alb+OrXnevkk91974Dy2xY
 CFg6Uz0tt969MXNlA+4KhDlc+lmhbSMQSXFHXwn+4NVtW+d6tfaChNatfwQJAZu83m3y
 q8lOTrElDC8Z4KIQmFZtuNAi9KBuvD8lVNmAOd7fK/L4ZYzxz2fzVhMeed1jtRpNjV3D
 BEdw==
X-Gm-Message-State: APjAAAWhK4Go1crKyf+igdmnx7klbbPJRVJbrteem2SXoQ1R8y57RjMm
 TuSzkoy7+MrdG4FF4mPfeMgWwDSFEiUoVOYgIiY=
X-Google-Smtp-Source: APXvYqwPky1kIBq5TGeLsTIdyi7DvZWNnzatsH+kjC7TN4z5yU4h0spZkmjXTrZZd+qsQ9tWkqeQPGyHHbV6+3Lse00=
X-Received: by 2002:ac8:3467:: with SMTP id v36mr22831465qtb.255.1576476081509; 
 Sun, 15 Dec 2019 22:01:21 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
 <20191211192742.95699-8-brendanhiggins@google.com>
 <CACPK8XctCb9Q2RaFVHEDuWxKDXpCWMWs-+vnKZ=SeTa3xRnT_g@mail.gmail.com>
 <CAFd5g45MFYMK-eZWPC5fhm2OkynUXKfArUVhbanYVH+qKRUwPg@mail.gmail.com>
In-Reply-To: <CAFd5g45MFYMK-eZWPC5fhm2OkynUXKfArUVhbanYVH+qKRUwPg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Dec 2019 06:01:09 +0000
Message-ID: <CACPK8XdgGLLT=RprY8zVW6kKJ6fjJdm4Oxs0uHBv-W5StMyGPQ@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] fsi: aspeed: add unspecified HAS_IOMEM dependency
To: Brendan Higgins <brendanhiggins@google.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-um <linux-um@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 12 Dec 2019 at 00:30, Brendan Higgins <brendanhiggins@google.com> wrote:
>
> On Wed, Dec 11, 2019 at 4:12 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Nice. I hit this when attempting to force on CONFIG_COMPILE_TEST in
> > order to build some ARM drivers under UM. Do you have plans to fix
> > that too?
>
> The only broken configs I found for UML are all listed on the cover
> letter of this patch. I think fixing COMPILE_TEST on UM could be
> worthwhile. Did you see any brokenness other than what I mentioned on
> the cover letter?

There's a few more in drivers/char/hw_random that you would need.
These were HW_RANDOM_MESON , HW_RANDOM_MTK, HW_RANDOM_EXYNOS,
HW_RANDOM_NPCM, HW_RANDOM_KEYSTONE.

The only one from your series I needed was PINCTRL_EQUILIBRIUM.

I applied this:

--- a/init/Kconfig
+++ b/init/Kconfig
@@ -91,7 +91,6 @@ config INIT_ENV_ARG_LIMIT

 config COMPILE_TEST
        bool "Compile also drivers which will not load"
-       depends on !UML
        default n
        help

That lets me build. However, the code I was attempting to enable
depends on REGMAP, which needs IOMEM too, so I hit that dead end.

Another issue I had was debugging my kunitconfig. This patch helped a bit:

--- a/tools/testing/kunit/kunit_config.py
+++ b/tools/testing/kunit/kunit_config.py
@@ -40,6 +40,9 @@ class Kconfig(object):
        def is_subset_of(self, other: 'Kconfig') -> bool:
                return self.entries().issubset(other.entries())

+       def difference(self, other: 'Kconfig') -> list:
+               return self.entries().difference(other.entries())
+
        def write_to_file(self, path: str) -> None:
                with open(path, 'w') as f:
                        for entry in self.entries():
diff --git a/tools/testing/kunit/kunit_kernel.py
b/tools/testing/kunit/kunit_kernel.py
index bf3876835331..0f261bc087e4 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -107,6 +107,7 @@ class LinuxSourceTree(object):
                validated_kconfig.read_from_file(kconfig_path)
                if not self._kconfig.is_subset_of(validated_kconfig):
                        logging.error('Provided Kconfig is not
contained in validated .config!')
+
logging.error(self._kconfig.difference(validated_kconfig))
                        return False
                return True

Which would need some tidying up before applying, but helped a lot in
working out what was going wrong.

>
> > Do you want to get this in a fix for 5.5?
>
> Preferably, yes.
>
> > Acked-by: Joel Stanley <joel@jms.id.au>
>
> Thanks!
