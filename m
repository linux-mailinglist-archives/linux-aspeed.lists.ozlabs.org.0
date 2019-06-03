Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AF432A65
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jun 2019 10:05:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HSK20NQ2zDqQc
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jun 2019 18:05:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ga6bafZC"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HSJs08dzzDqPg
 for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Jun 2019 18:05:00 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id 14so8353685qtf.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 03 Jun 2019 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RfaSV+pbk7w6/znlXv1qGSq++xp8hdtnx0rwYlptGts=;
 b=ga6bafZCmHxDV+BcmEwAaQsBBlEZkPFYGOsxhVLqSVdLrMiD8VQTGepUAJnHL2G3wY
 Aji+SLUEIuw0MSIMC3cBG6nJMELOFarVv7dHMqaO1WN8vDLzJlhClRQjA9PX9dYnQY77
 ZTEMJ4wNAzhm4f9EYkjt8OoYi9gVeLbnydEao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfaSV+pbk7w6/znlXv1qGSq++xp8hdtnx0rwYlptGts=;
 b=Q4B06PROThX0vO612lWinjKKfCdb7BWPVb9CZWUuoIWLqhPD/tq8v8AHPaZmMj6gcE
 S5/wDoLHRuzpVTjCIWAwhkyfwRMHSQ40L5uOiqd2/R1Cjdxxp+0oqUemz3P+QzVNvcaa
 KlIluaDuj0aOGccMl+6MozazDJ9aoqHGegwvL+sDqDorQWyeaiWCMkrTwfT+B+Sf5soQ
 R2yqf2Mb5azsheFW03Ihr+f+lskOqLB028zSxaNUwexGevjDbAFQCmvhJXU5GDG7PikJ
 kQXsEw0FMpYnNVPugqNlEyf2fpAeN2r4Mne0bPBL2SXeXhETAATld5/tpfRYJ1uF2Bi9
 rjBg==
X-Gm-Message-State: APjAAAVjeHKQPQ32fuvqRxRQEuB/oe+W85w8BpjsoFyv9eF27lnGa2FA
 fAp4VZdMeAiKiK9Q1/pr7ybXgiXNvDtc/jk12qs=
X-Google-Smtp-Source: APXvYqzsF073EvPFX4Takz8KWZ3H1JBY7zZTMY9VElYM72O2DrEKUU55vAn2In2dlmNN7QDVZrx88Z1tiSxYiMYUjoU=
X-Received: by 2002:ac8:2493:: with SMTP id s19mr1721030qts.220.1559549097905; 
 Mon, 03 Jun 2019 01:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190531090950.13466-1-a.filippov@yadro.com>
 <246c9b25-1c05-4c2f-9185-c438c97ebdec@www.fastmail.com>
In-Reply-To: <246c9b25-1c05-4c2f-9185-c438c97ebdec@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jun 2019 08:04:46 +0000
Message-ID: <CACPK8Xf9emq+rYjT=O8kQfc-oMcKZwAwXwZ1bciDr+R3CyWz+g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: dts: aspeed: Add YADRO VESNIN BMC
To: Andrew Jeffery <andrew@aj.id.au>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Alexander A. Filippov" <a.filippov@yadro.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 3 Jun 2019 at 01:28, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 31 May 2019, at 18:40, Alexander Filippov wrote:
> > VESNIN is an OpenPower machine with an Aspeed 2400 BMC SoC manufactured
> > by YADRO.
> >
> > Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks. Applied to the aspeed dt-for-5.3 branch.

Cheers,

Joel
