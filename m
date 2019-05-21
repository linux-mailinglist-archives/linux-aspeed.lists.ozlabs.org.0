Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8A824EA1
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 May 2019 14:06:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457ZHf4gLHzDqLW
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 May 2019 22:06:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.195; helo=mail-qk1-f195.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457ZHX4hQpzDqJC
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 May 2019 22:06:30 +1000 (AEST)
Received: by mail-qk1-f195.google.com with SMTP id q197so10842003qke.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 May 2019 05:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SVsTcwbSXyDKa9FaSATioyfgfATBsO2UVB5hXgNRDGU=;
 b=ieEjMx1OK0sPKmRZaKJ54qo+DM5ucJHE3WxR4ExVVv2EHH/FCrWyIz/mrKLiu57zKY
 fRwUYsNG4XyjPyLYeyA6Arzu3FiOuTsMzZjxrXk9cPt0p1ZSuvbV+eMKr1vWIYSYRzzY
 HCXlfGVDwxbDyVGbcQ/MiuPXxob2G9Zuqs33DaQxjqv1rY64Ofbm9xivaoBXugERZqoD
 QnI0xomV7lU2DeI0eFWYdmfIqXbjphkoHpKlL0h+QrDlNmPhZ9qzvbGITycL1OIJkwCE
 MdUQOjuG/LHSYRNXgoUlMX4aj+yBSIKj4XYtoTKHk5401oSLMcEWlb9GY88HASw1GBMa
 kKLg==
X-Gm-Message-State: APjAAAWpkcOavxMzYnSFW+pL4byDCYQhcXZXojRXiyqbt0eoN9FPViC5
 nFpOc/hcEZpIKOWRj5LXhh/YMLI2EQYui9knpGo=
X-Google-Smtp-Source: APXvYqwtbMXWbcpZkpurvbTnz8ZSYDkvuMAiZAitynBUdC5HgLlJCLa614LeBCFxuz8JnW/vd1HtztDq3B07yoz2uQw=
X-Received: by 2002:a05:620a:1085:: with SMTP id
 g5mr46716572qkk.182.1558440387587; 
 Tue, 21 May 2019 05:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <1558383565-11821-1-git-send-email-eajames@linux.ibm.com>
 <1558383565-11821-5-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1558383565-11821-5-git-send-email-eajames@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 May 2019 14:06:10 +0200
Message-ID: <CAK8P3a1DxtZFtgHbM7RmcadvRd8ZzjYXjR41OxhDkiKg55CTMQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drivers/soc: xdma: Add PCI device configuration
 sysfs
To: Eddie James <eajames@linux.ibm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 10:21 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> The AST2500 has two PCI devices embedded. The XDMA engine can use either
> device to perform DMA transfers. Users need the capability to choose
> which device to use. This commit therefore adds two sysfs files that
> toggle the AST2500 and XDMA engine between the two PCI devices.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/soc/aspeed/aspeed-xdma.c | 64 ++++++++++++++++++++++++++++++++++++++++

This patch needs to come with a corresponding file in Documentation/ABI/

       Arnd
