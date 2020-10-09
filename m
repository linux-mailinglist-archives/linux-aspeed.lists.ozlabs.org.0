Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6F02888A2
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 14:26:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C76kx0qNQzDqcN
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 23:26:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=sergei.shtylyov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DvEcPpSs; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C71Kf5NffzDqYJ
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 19:22:58 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id r24so8757939ljm.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Oct 2020 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z4PYgixxEo74naXVTGCu473YIzjZyoMssDBGjCVNhz8=;
 b=DvEcPpSsHXvt+QCKNgFD0OGbS0cOIPIHELaLxGjbP37VbXYPPozfcIRAdrSmOR8HvV
 S0tXg49NuxysApDt+TalMm467uLyRoSZH2lrDZZLGXmK8gSf7V+wzyQgEb6o61PcH5Eu
 /SuIDyKLxzATkYuFFkoZlx6a4PFXw02IiWr6VZs+tCcpjLnbSgJe1xMkU7OsWzpp2T83
 6oc/b4AfsTwrDsWLkm4NURIQhxqyyTGdolrTaI2z401NHkwA98DrBFAPgRZL6kXk6lIi
 fTcClX+nTlqX7peXiWnk3fFFg5pFFegtt5+0QvuQbsaFt8F9gJcm5/zw03TVhozozCz1
 ecHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=z4PYgixxEo74naXVTGCu473YIzjZyoMssDBGjCVNhz8=;
 b=h0RfVW3XIPcYZglFIZV+5F3vaBQzX/a0zUSnIHYBJDuMYOlDagcE8VhinUJQJjNCx9
 dVkFee17Wx9WvEamol5ud5bIHCTIdDEW3fGtY+Zc6us+qzWGjLIPgwwp4BNhoMYTUopH
 nSs037aCv5w3nGBWx8BBVdXrgxmvpvGtF7iCNKmUnMdNYq7xUBYVxJuQj4tCSbhiediC
 HrXK+fmyBo2vyzRaBohxJgISaVOhGdQEI67c6RM4aadcZCU1h09gKe7gNLMVTj7M4pKJ
 3zGJ7L/LQoAYrnrHXoWoKJb+Dm44A2Miz45mn0v5hSMgRKJKfQovd9XVZMPKvAJCZsDv
 JIyg==
X-Gm-Message-State: AOAM5308W3Z1MYLCFsYxkekFY44+KS2+sjnvY8IfJTc/KBKf5uGffx9U
 EBJG+JV4iVrUNnFRo7L1o6s=
X-Google-Smtp-Source: ABdhPJyCc0AibnzQbXHWDVK6b5qd4dQXk2CIZ+rxQ8FfNIh/3E1HoS8vWe1fFdjiMjJKICo8WL7eRw==
X-Received: by 2002:a2e:8159:: with SMTP id t25mr4863515ljg.137.1602231773820; 
 Fri, 09 Oct 2020 01:22:53 -0700 (PDT)
Received: from [192.168.1.100] ([213.87.137.199])
 by smtp.gmail.com with ESMTPSA id v11sm682269ljk.109.2020.10.09.01.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 01:22:53 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] ARM: dts: add ehci uhci enable in evb dts
To: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, bmc-sw@aspeedtech.com,
 Alan Stern <stern@rowland.harvard.edu>
References: <20200930040823.26065-4-ryan_chen@aspeedtech.com>
 <20201009024937.11246-1-ryan_chen@aspeedtech.com>
 <20201009024937.11246-4-ryan_chen@aspeedtech.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <4efff4e7-27e0-35be-c112-5377f222a478@gmail.com>
Date: Fri, 9 Oct 2020 11:22:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201009024937.11246-4-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 09 Oct 2020 23:26:42 +1100
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

HEllo!

On 09.10.2020 5:49, Ryan Chen wrote:

> Add EHCI UHCI enable build in aspeed-ast2600-evb.dts

    Enable ECHI/UHCI for the  Aspeed AST2600 EVB, perhaps?

> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
[...]

MBR, Sergei
