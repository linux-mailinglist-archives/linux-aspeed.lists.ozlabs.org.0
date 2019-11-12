Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDDDF8A33
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 09:12:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C0pJ4SkJzF5J6
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 19:12:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Tue, 12 Nov 2019 19:11:59 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C0p76PJQzF5Cb
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 19:11:58 +1100 (AEDT)
Received: from mail-qt1-f171.google.com ([209.85.160.171]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MP2zs-1iG5Cm2PKm-00PJ80 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov
 2019 09:06:40 +0100
Received: by mail-qt1-f171.google.com with SMTP id 30so18814111qtz.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 00:06:39 -0800 (PST)
X-Gm-Message-State: APjAAAUPIKJOTNqe3yZ/ZvILI5e4qEJfGhFCG/uSCWVmq3CRT2L0Erh8
 swbH7/J1si61jov3HquPiTP1t7drdUib3sj6yAY=
X-Google-Smtp-Source: APXvYqzdm/M1pFpfkmeJ966cvuKqdZng0AcL0hQKs4QX2EH8UkeViUAPx1/kZ0x+CF/V302usIEzAmECJ4FtR8SCpzk=
X-Received: by 2002:ac8:1908:: with SMTP id t8mr29708341qtj.18.1573545998479; 
 Tue, 12 Nov 2019 00:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20191112062857.32638-1-joel@jms.id.au>
In-Reply-To: <20191112062857.32638-1-joel@jms.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 12 Nov 2019 09:06:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Lhsa7S_Zto74omx7iLNcSbVjSfm4BAOY5NgN5S5gqRg@mail.gmail.com>
Message-ID: <CAK8P3a0Lhsa7S_Zto74omx7iLNcSbVjSfm4BAOY5NgN5S5gqRg@mail.gmail.com>
Subject: Re: [PATCH 0/5] ARM: config: ASPEED updates for 5.5
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ER57j5wOD6HPvBDmVcPm97xmM6tPY59UvnmBAcf2/bFP8oyClx7
 kzn0ysyGl39VaD60qFeLcFFUEPaxCFCLxL1zDM0+oYpxIGlt5kFqvYcq6kbVk8UG7C3C1x3
 Ds5eb/Jn5Wf9YZF9okMUyNjKYobI85FtxnhdNGW8jvhgRvK1R4su2Iezb5g8BFHGOsNL1HJ
 Z7dBx3zTRood5yA4cYRxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lh8+obCgRNo=:yBmEz+z9dMJc1O5Mb1iuga
 OCjW3YxqAo1+bCPGYtoEt+0hv7GQKei9DSmce27V0vC7NL7MqTaVtr2LdeebWkY87faigMt8t
 OnjUoEwTj6aRjT8TTm6yZ/YI4B0P8cMkWhQHTx80+3FfSdzL6tpbMoF+iTzFDlYU0eWeeHOI4
 x2A+HeuFLSZQWG48fCV2Z5Q7TzMbpgSwQLejzMPGAsevGE7eW9W09s0eiZPMJ9WLsSACveDbB
 T00ohGSEVOcr7pLyMtelCPdHAvrdm7afBUCCWv40RC4gXnAYa0XMJatwlDZTXP8HOw2jRmREH
 AlBcOhqyXsPrYroweXgTyjSWzps0awTud2YBlVM2WxTuFybUYzHEaWfgsuqDGVfbrrXOCmhHO
 HStQ6pmQ/nDmiVZGv30upq4/VFlVfOTy0n69J5GQHsg9MyrebVCSim+JEXqir3KAErxcIF7nr
 HVyrlpmSvxh2BPD8s1wclPRFavq4KSWRdsE06L+WBnIKNsMv4cJxuzMncwIdLoa82tLDSEVNS
 cCVkSmT+p+L5ydZ/+Tilx8CewVsT6v2Cn/HSx7kBvRfh6vYBUjG2nKmNRueqaE50qNFceDA5r
 8xK1Gs9rnp6FgWNWV+lu5Q+HdPeJthnA3X1oINcWUNQcgRkxx3eDIyM3D00Jl98LgyJBKmZch
 iV5Ob9bD8i4wl6XpWVN9wik/MFN9tNoeTWv6P8nKDOR1SLaKeSJxObUbuQH2GYRubxj3NnrTs
 m6DpHdq9ADXaHZtuULlkc/pPf77OcjkB55j9iSxv+5Ftkp3ud9YQaZ+xOuC5dZJa8UTGmn9L6
 a6eUeGtA836tjk+gpKK18RNlXN0GdwA+v5YgkqONeldrwP+gaDEmUFAxjrXks6bVz6VO+MG3a
 dNZUg9SVnfauW7q4XvWA==
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 7:29 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Here are some additions to the defconfigs for ASPEED machines that I
> intend on sending for 5.5.
>
> If you have time to ack them that would be appreciated.

These all look good to me

Acked-by: Arnd Bergmann <arnd@arndb.de>
