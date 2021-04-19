Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E8D36465E
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Apr 2021 16:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP8jt1Kzmz2xgK
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Apr 2021 00:45:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP8jq6ZWGz2xZZ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Apr 2021 00:45:00 +1000 (AEST)
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N0X4e-1lkViu03aG-00wUmx for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Apr
 2021 16:44:56 +0200
Received: by mail-wm1-f42.google.com with SMTP id w186so13827886wmg.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Apr 2021 07:44:55 -0700 (PDT)
X-Gm-Message-State: AOAM530fiGYvmt223o0zvANxBCcqDf7KjOsWSTzszE/VSiJrrnvfH7w2
 4UiaESFi5iCS3jgg0pRsEY9gcWpemUPPvyCSSzI=
X-Google-Smtp-Source: ABdhPJw7qcfKMobGVenQr0RkHIs+d3bPN79IEwmrNiIriuBPJAdh6tyhZljPRwl19JD0XPtw75uuw7csDyaRPzvncLs=
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr21646797wmj.120.1618843495594; 
 Mon, 19 Apr 2021 07:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
In-Reply-To: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Apr 2021 16:44:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
Message-ID: <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1qU/F6/zkSvCO4wzqclDanwYpnFRaDIfYJj1gpsEd+3ixKNMoCn
 5r0ZiwnmXdnNatoFr7Rd/hd8BDZZPrZpsMimEOInx+hNH/4h6/WfSbEpO9fFbgq3ImW9ZEP
 vjlBFSRFueW68WGeO1Ou1wk2HNzE6ljmcbkSDMyMPR5LECj6ENLgcimNGWlBpWLWV+omk2q
 d7Pl8Yyq+xb4xhLG3n5cA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iG48eU804bE=:bK1USOd3/e0l2W5kf1XPpa
 m2vz8rK7405K4mAWWQkptgMq4UNsh58/M7izG66Q8xHZ/PlR7u9zHmkclmkej1OCE0TfsfGfs
 X2Kfj7oCIzOnFf76w8kr3U4cfL5kro2hpJ1SApX8PsO/15jSKQomH2vYfb9FylDHB+pWZc9Ke
 85CmEaZUPLDOMd0GSFp571gJv7pZFsZQ1LpYnX+e8qCU2Mw+6mO1MJu+d81OnWGZX3YQxTTNg
 TDb4RkfTMa9DKuvNeIvb3K114c/P5RP0Ghb70MzFO03R6eoZm6bwHx96JMS8Fa71KQoyQwwHT
 Teh+8Q26y8b5IqHbK1KObo3pS9dgpB63A3z0PkN5NVn4UJi7neU+OxHEYLAuS4ONO8JU2f+Ns
 LPwrkxiaQLYPwoTAiCaix+E1P37f5hT7Dmw93YzFB4gmsGwjs3oJBz/JBwuFT/RVsIzo2jr2V
 MO1ZWhxfp5DYlUOxqFTCAHUuw8gCOpUlyCTBvZpykBiff9POLxbd5H5Hs8JNzurr18URogPCt
 7sMmACIlzuuZTQjZim7JCz4OISdtxWc8SNKoDF3Eaq99eiZzuTLhwDf+it+Zf+yoy9UCJdVVZ
 Gb1G+2xQgiWSIFIu1R1M0+5sqk0zNmv5z4vgtW0HeeF8dR78oG4wq21v/jAbfv71jS30e5yTi
 Dy24=
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
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 5:27 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Soc maintainers,
>
> Here are some fixes for the changes that have already been merged for v5.13.
>
> I also merged some changes that came in later. If you would prefer to
> not take them then I can send a pull with just the fixes.
>
> The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
>
> for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

Hi Joel,

something about this pull request doesn't add up, and 'b4' refuses
to pull it since the 'since commit f0145db2' and 'up to f0145db2'
references refer to the same commit.

I assume this is just a copy-paste error on your end, but it would
be nice if you could double-check and resend the pull request
based on the ee33e2fb3d70 commit that I merged.

       Arnd
