Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B12BE581
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2019 21:20:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dnvB4C7dzDqjG
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2019 05:20:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dnv320cyzDqX9
 for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2019 05:19:56 +1000 (AEST)
X-AuditID: ac10606f-371ff7000000187d-a9-5d8bbdd8a5b9
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 58.7C.06269.8DDBB8D5; Wed, 25 Sep 2019 15:19:52 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 25 Sep 2019 15:19:51 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij
 <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 <linux-gpio@vger.kernel.org>, Joel Stanley <joel@jms.id.au>
Subject: [v1, 1/1] gpio: dts: aspeed: Add SGPIO driver
Date: Wed, 25 Sep 2019 15:19:48 -0400
Message-ID: <1569439188-10378-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569352021-6383-1-git-send-email-hongweiz@ami.com>
References: <1569352021-6383-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA01RW0hTYRzvO+fsnLPF8LQGfliJjG4E3iLsC8TLS5y3xJdAFD3oQUfTyeYt
 QZqahVNEhpUty8scxlxFm1Quh7obaqIOl04TfTDIl7KlpjhHtY3At9/9//CncYmFiKPlFVW8
 qoJTyEgRYWaKOhP99raCFOe0FPW8MZPItkijPz8/ArQ/rhegkM5DoSbHDIl2n88QqNc1J0DB
 +RCOuo6GMGTZXBKg5uE5HFl7jwBatPWQyPHIDpBx2Yuh7V+tGGqxuyjk79KQyL6+A7Kk7OeH
 Noo1vzADdnHJi7PBQx1gt/0tFOsNeHDWYmol2bWlMZKd6g4SbOfABGCtg/fY+e5+wIYa9yh2
 6sk+we5Y4nNi8kTpJbxCXsOrkjOKRGWzOj9V2Y/VtTyepDTAB7RASEPmGny5MUZogYiWMDYM
 7v4YxKLECaBhqJ0Mp0jmIrRbeyKGlJkAsG99HYQJzjQJ4JgzENk6zaTBg+WRCCaYC3A1oCHC
 WMxkwbWpT4LovXi4MteKh7Hwn/5KtxDJSJhMuO8+xKP5U3D66deIjjMQTm5t4dHMObjq2MSi
 OwnwW8cm0QkY/bGK/lilD2AmIOGqFOWcXFFaezWJK5cnFSvLLSD6V+UHEAhcdwCMBg4AaVwm
 FevPagsk4hLubj2vUhaqqhW82gHO0IQsVmwy/86XMKVcFX+H5yt51X8Xo4VxGuDWguq+XD7B
 Wf+97eRwtsUI3OmuBk/8/WypL5R8udDQnOrJPn9JbQi6xosXjEJbevJySseJESavMTNxI/N2
 nOGLeidGk39zJMv3gJLcau9IPEgr28sQE2+f5Q0Uj9ZMvDeNuutmgDDR+87alTPbrXzbvOKL
 3bhRa3zN5DbICHUZl3oFV6m5v3DXd1rFAgAA
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Rob Herring <robh+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Doug Anderson <armlinux@m.disordat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Hongwei Zhang <hongweiz@ami.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> >  obj-$(CONFIG_GPIO_BD70528)             += gpio-bd70528.o
> > --
> > 2.7.4
> >
> 
> This should be split into separate patches with one extending the binding document and one adding 
> actual support.
> 
> Bart

Thanks Bart,
I just submitted splitted patches.

--Hongwei
