Return-Path: <linux-aspeed+bounces-4474-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MXg/Kp2FVmps8AAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4474-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Jul 2026 20:53:17 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D26757F7A
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Jul 2026 20:53:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=9elements.com header.s=google header.b=Vj6Q7HIE;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4474-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4474-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=9elements.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h07jj6wQmz2xqM;
	Wed, 15 Jul 2026 04:53:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784055193;
	cv=none; b=kZI8y3qPG8mCjjFbtegTYFQ0jlOQkPA8Tj1o6NGw7yb/BkDKjpfFHZiZEoNfr9Uw66h2NlgFtXSbZg3hULvGE+XoK6SYMTG9DDnuZOJNzgmGheHQtJ1ya/3lJjBJJz5HmA8vC6WX4JZIWZ9yAljAMDBhDPYa0gnCI938C6h8hxKLbSUgSuCraYHqIbzARgDM7SXT85tGqBprW+s24OHIWt+aEPfmj0FG2y1yMddxWuqQPjN4oD6GZq+2RmDxBTS/oFiYA7Rw3YX1l4Aq7rpK0yD6hQ1XlzQcwEQXfAqHwHgkLhLjWfHIPFsaaZ20uxwiEUGnh8nESwVaYM2uVB8adg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784055193; c=relaxed/relaxed;
	bh=pcNBWSk81aXJRf1HEe9CIzvLtrqcVP1uAiQM4+26Yvg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OAMDLvZeaih/2I5rjyUZ9F/Ni/Vdi6/x+aFWHBEDlTv122Z/tZSm1qOFCBrMQn1kIlLuIUqvH1IlCaBTg4GVgGsABmO91+3ukEIlEzTf6Lus+uRGVx0vFwQIWtFemWlTI/uU9+euH1WYzLxc8/SshO4smVpLcg0LYY0I/9jQR+UsTBIz+6Xk5Xmv0CirnQ4Xk1k7jc2blNcwSKPt998NCiR47Sg2D+CqOlW+KSWBZABtfQ1G6lV9n8DkNs4sDUkhFWWPCz3FNZSFDXMfMyVYWukqpS4ekeakWbIAMiKe+uok/F3oQGHI2KHCZf3yqi5c/7Cjji3QLM92OSwdXy7a6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Vj6Q7HIE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h07jh4GQVz2xyj
	for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Jul 2026 04:53:12 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so8935655e9.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Jul 2026 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784055189; x=1784659989; darn=lists.ozlabs.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pcNBWSk81aXJRf1HEe9CIzvLtrqcVP1uAiQM4+26Yvg=;
        b=Vj6Q7HIEVMsQu2zj//lG+GujMNCoZHjwgkEDJKU1Mrggii7luvhcSkEWBT7J7x4qsK
         gzloM4gow3ffLbwV6NRz2EZp17Sn0Fvh3RlNvfIgklaqvCoMbUMOLBlFnpHRfpOazz9G
         5yNGGp9IUnHnILZEd5PrLTZEWmDbXuzSc1YyegLNIhNQitq/ea2DmIIfzCIqCvUeWPBu
         9N0PXjdlQrYMpaFZn2Xd+Ol5rtqUVt3MndCnZR+0Y2iuWgdug+7s4jE19BWSv+Qsqdt6
         37ffY2FRdtIoUECz42vbSiDeFGnJQfQb6ztrPeu0tkV3PsjKMy6eBgpya2YDyE6hidBK
         VxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055189; x=1784659989;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcNBWSk81aXJRf1HEe9CIzvLtrqcVP1uAiQM4+26Yvg=;
        b=mcKinVAoKIp9QMDCSEtYScNyXtUvK4GXQHSCXWhu/VOnJC5PigQgNTcbcJckGLIyPn
         NvQLHUNwCXQpwawes1JHXN/yB0Nz4q7ph33opWKEyQDOy/40bHpUItkl+Jz432t1lWxh
         GifuwplAhO1rFFvsk99yxX+Y71J9e4xMFiEhUtCvCbeSU7WFGM9wTlERNCE6BcRVPh5R
         kOStlnmAkVfiRpT/jrQTrvaT7N3FI1IK8kk9Doqkvignob+mdB0alHboXaxqRyfgJzON
         2WdvF2DJDvZQlu3WH6c77uAJ/7URBPl08hk7KykgzflDKXGZYa5U9CoXPJYyhUmofbqT
         wINg==
X-Forwarded-Encrypted: i=1; AHgh+RpdfhjzMmef7wxfcAob/EsC2FlSMt3Otr5KcYj3laQghuQaX4v6VtGWaFTHpxH74+sWTURjQEWxVekuiz0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwhDdo6yme+BG9zzcnONPJelvgFZ3AJN7tmJ1OMmcE+5G3T5MIU
	kQAJbGWD1nncZoEbQ4MfwMCG0E/7odSKHZcCNRYZl7JddNjTuHAcAX3AvL5WadBiwGo=
X-Gm-Gg: AfdE7ckQWEQznCVLw0vDz0iiOj2bIL4qvltda62Sof50P2SM/CNZunHuWOSY5zBTiB2
	3d3XRI7k786KUS7TrF6ukVcap9BOtHXQxgZ261giIZDE4rA0xf/TvDQHhGJmMuCiwFfTKFwAl2T
	GGEXLBrvFtTsTKxcxCIKb0xX1GBonLxmSl5f+9c8BxYBiccRQI24MTxExXh8BTo2e/oCkUFZvCS
	Ap7PNvh2rpPv683yHTnikbzhMgwpySb9A7x+El2ExG7TCt4lmH6G+O6TVkA0u7GMFauT27Bnoht
	uU9WdP6dWmLZeEnIeiGInxziCRDa/I+2FiXo1hhDG3do3Et1aEJuES98FuzpiF2eTPgwbrcFAiq
	zmSDntrSZIvePtsyxy4fRLLFSp/YGtFSIuS2/K5Fe6/B2xW36zq5bs0VFNMEXDkete5M638j9cr
	2mrVQaAV0siR7PgWYt4/b7q5IsskiPE5IE4BXCaSu5
X-Received: by 2002:a05:600c:6749:b0:493:edde:54c8 with SMTP id 5b1f17b1804b1-493f8885b92mr156957465e9.8.1784055188747;
        Tue, 14 Jul 2026 11:53:08 -0700 (PDT)
Received: from [192.168.254.124] ([2001:9e8:2fb:8201:c26a:83ef:161a:409b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508725c0bsm94908715e9.2.2026.07.14.11.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:53:08 -0700 (PDT)
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 5/7] soc: aspeed: add host-side PCIe BMC device
 driver
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 20:53:03 +0200
Message-Id: <178405518338.194693.10884980497331757324.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055186; l=3719;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=Y9FJBI04v0b5TlI5275Tjuzdsyze3l17kCBKDrC4yME=;
 b=jjkhqaKHO+0KwEYLlPkLAmN+G/4gp2YBj1bgs+ajAChgEUNu9rY2W3prwusboACuGjyMx6z22
 H/kuiBmepnRCk9sHRrP1SCBIKVLrvkpvhwkwVi4bUWnB5HrF/Z7N5kF
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregoire.layet@9elements.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tan.siewert@9elements.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-4474-lists,linux-aspeed=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tan.siewert@9elements.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[jms.id.au,codeconstruct.com.au,v3.sk,vger.kernel.org,linuxfoundation.org,kernel.org,lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,lists.ozlabs.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04D26757F7A

> Add support for VUART over PCIe between BMC and host.
> Add the host side driver.
> Support only the AST2600.
> 
> Taken from ASPEED 6.18 Kernel SDK and trimmed down.


> 
> The host can't detect the VUART addresses, so force them to
> 0x3f8 and 0x2f8, as in the initial ASPEED driver.
> 
> Change the MSI vector index of VUART2 from 15 to 17.
> The index 15 used in the initial driver was not working.
> 
> Data path in both direction is tested on both VUART.
> 
> This module is added in soc/aspeed as it's very soc specific.
> This is not added as a PCI 8250 UART device as this host module can
> be expanded upon for IPMI over KCS. It can also be used in the
> future for custom BMC<->host communication with shared memory and doorbell.

While I understand that this driver could be expanded with more features, it is
still not fitting `soc/aspeed` as it is not for the ASPEED SoC, but for systems
that communicate with an ASPEED SoC.

Maybe `drivers/misc` is more fitting for this?

> 
> This host module should be the entry point for setting up all features
> related to an AST2600 present on the PCI bus.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index f579ee0b5afa..147a9033bdc4 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -55,3 +55,18 @@ config ASPEED_SOCINFO
>  endmenu
>  
>  endif
> +
> +menu "ASPEED host-side drivers"
> +	depends on PCI
> +
> +config ASPEED_HOST_BMC_DEV
> +	tristate "ASPEED host-side BMC PCIe device"

"device driver" would be more fitting instead of "host-side driver" I'd say.

> +	depends on SERIAL_8250
> +	help
> +	  Host-side driver for the ASPEED AST2600 BMC PCIe device found on
> +	  BMC expansion cards. Exposes two 8250-compatible VUART
> +	  ports.

In the commit message you're stating that the device driver can be expanded for
e.g. IPMI over KCS. Should the user be able to disable features selectively, or
do they have to always have 8250 serial support active?

> +
> +	  If unsure, say N. Choose M to build aspeed-host-bmc-dev.
> +
> +endmenu
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index b35d74592964..c515e163eab7 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_ASPEED_HOST_BMC_DEV)	+= aspeed-host-bmc-dev.o
>  obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
>  obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
>  obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
> diff --git a/drivers/soc/aspeed/aspeed-host-bmc-dev.c b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
> new file mode 100644
> index 000000000000..e586d0505577
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-host-bmc-dev.c

*snip*

> +static int aspeed_pci_host_setup(struct pci_dev *pdev)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
> +	int rc = 0;
> +
> +	pci_bmc_dev->message_bar_base = pci_resource_start(pdev, 1);
> +
> +	if (pdev->revision == 0x27) {
> +		pr_err("AST2700 detected but not supported");
> +		return -ENODEV;
> +	}
> +
> +	rc = aspeed_pci_bmc_device_setup_vuart(pdev, 0);
> +	if (rc)
> +		return rc;
> +
> +	rc = aspeed_pci_bmc_device_setup_vuart(pdev, 1);
> +	if (rc)
> +		goto out_free_VUART0;

This goto seems unnecessary. There's no specific cleanup that should be needed
before.

	Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

