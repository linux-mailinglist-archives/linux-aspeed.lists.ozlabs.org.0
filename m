Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE56AFC91
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 02:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWb5n4r3cz3cBK
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 12:56:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Spc5p3ov;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=tudor.ambarus@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Spc5p3ov;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTDgf5wdwz2yNy;
	Sat,  4 Mar 2023 16:59:24 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id d30so18487381eda.4;
        Fri, 03 Mar 2023 21:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZdOR2mQrM2Yh/ZdXBDU9hVL0HlZsZVueh/CEeqYueU=;
        b=Spc5p3ovs3CEvWjvB15Lsxi3xGjMUIlNSYNFAcggChHEqyh1XQIV3ghzRysFCQdwot
         B+Pzk25ozrx9jxO/cugIqFD/r06/RjYzQnBpUsHfl/0KYoxab8FIKN/6rnu8co2Z7lxk
         Mz/CVbIsMog2abpNbYK7pFe96zz3t3Rm2GralvuU2HiegQXFXYRGe79tiCnlqDK3Rrl6
         8VS8m3lEou653ypRcub4hORgngyVE/4CfwaI/6Ymv9PPP20xwlEC+gP0A5TBq1L9JjQx
         WqrbysUxMMTh2VK+L+GDogxIkZBJXxBrm5+58547IY4AFuOrd0rJYXORJ4HKz5lJfuqe
         f6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZdOR2mQrM2Yh/ZdXBDU9hVL0HlZsZVueh/CEeqYueU=;
        b=KI4e6dyOzGdjRMEQgQQufzkI9LzWmu4VZBP4IJssbsPoml1xtL4EGsdnl1d0oQUfoK
         qTdVAp9NjnVK37Hp+WITpSMZXbP4/j1LXa4oHsz999XnAd7rTaS7uaUbZLXtC8PyRkkm
         eap+W3sBfSCtKO1f8ScNuF1IKDyyAU7FB5t5/uV/CvAIrGQLX/9D4ZWGKenLCIEEsRZR
         0/BUiSJ6F19l+DeINpaEkqZ/xd40ELxUPjTrChP3r6F7oKwtXUgJddIQcUh62J6xSKhE
         MNRxVwPyz3XojhseXfurNcMU9fBTqeqm1dzqOIAeMwGU8E2pCaJXlKCoj0257b0F7w8W
         0PIA==
X-Gm-Message-State: AO0yUKVFQeB/OTOHxHCzvmqGhaH+0+QM41ruNgA7vXG9gfoTRWbWFSIh
	CQ/Y2PmMPnuR9yQgxw6pojg=
X-Google-Smtp-Source: AK7set8UXUFWR2ui/AgXkHFAvLBJPzNPX6LhnlTox4YZzu7Cyy9qpwNmgZWB6VYga3nqRk1K4I90aA==
X-Received: by 2002:a05:6402:510:b0:4bb:83fa:5e83 with SMTP id m16-20020a056402051000b004bb83fa5e83mr4125414edv.12.1677909561087;
        Fri, 03 Mar 2023 21:59:21 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id v12-20020a50c40c000000b004bb810e0b87sm2030841edf.39.2023.03.03.21.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 21:59:20 -0800 (PST)
Message-ID: <5bd48f09-f7ba-e5b3-60ba-49ecd1493e36@gmail.com>
Date: Sat, 4 Mar 2023 07:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
To: Sergiu Moga <sergiu.moga@microchip.com>, pratyush@kernel.org,
 michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, joel@jms.id.au, andrew@aj.id.au,
 kdasu.kdev@gmail.com, fancer.lancer@gmail.com, han.xu@nxp.com,
 john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com,
 yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, michal.simek@xilinx.com, tkuw584924@gmail.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tudor.ambarus@linaro.org
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
From: Tudor Ambarus <tudor.ambarus@gmail.com>
Content-Language: en-US
In-Reply-To: <20220911174551.653599-1-sergiu.moga@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 08 Mar 2023 12:56:37 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

Sergiu changed his interests, I'm going to send a new version of this
patch. We really need the conversion in SPI NOR as there are flashes
that require a number of dummy cycles that is not multiple of 8.

Cheers,
ta
